import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:overwatch/constants.dart';
import 'package:overwatch/services/database.dart';
import 'package:provider/provider.dart';
import 'package:overwatch/bottom_button.dart';
import 'map_screen.dart';
import 'package:location_permissions/location_permissions.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final _auth = FirebaseAuth.instance;
  var heartRate;
  var temperature;
  var latitude;
  var longitude;
  User loggedInUser;
  @override
  void initState() {
    super.initState();
    getCurrentUser();
    requestPermission();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  void requestPermission() async {
    PermissionStatus permission =
        await LocationPermissions().requestPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().healthAndLocation,
      child: Scaffold(
        appBar: AppBar(
          leading: null,
          centerTitle: true,
          title: Text('OVERWATCH'),
          actions: [
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              },
            ),
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: ReusableCard(
                background: 'assets/heart.jpg',
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Heart Rate : ${heartRate} bpm',
                      style: TextStyle(fontSize: 20.0),
                      textAlign: TextAlign.end,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: ReusableCard(
                background: 'assets/temperature.jpg',
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'TEMP : ${temperature} degree',
                      textAlign: TextAlign.end,
                      style: TextStyle(fontSize: 20.0),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: ReusableCard(
                background: 'assets/location.jpg',
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      '',
                      style: TextStyle(fontSize: 20.0),
                    )
                  ],
                ),
                onPress: () {
                  if (latitude != null) {
                    print(latitude);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return MapScreen(
                        latitude: latitude,
                        longitude: longitude,
                      );
                    }));
                  }
                },
              ),
            ),
            BottomButton(
              bottomTitle: 'Fetch Data',
              onTap: () {
                var user = _auth.currentUser;
                setState(() {
                  FirebaseFirestore.instance
                      .collection('healthAndLocation')
                      .doc(user.uid)
                      .get()
                      .then((value) {
                    heartRate = value.data()['heartRate'];
                    temperature = value.data()['temperature'];
                    latitude = value.data()['latitude'];
                    longitude = value.data()['longitude'];
                  });
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
