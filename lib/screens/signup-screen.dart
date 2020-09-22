import 'package:flutter/material.dart';
import 'package:overwatch/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dashboard.dart';
import 'package:overwatch/services/database.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('SignUp'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: Container(
                height: 180.0,
                width: 180.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/logo.png'),
                        fit: BoxFit.cover)),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Flexible(
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: kTextFieldInputDecoration,
                      onChanged: (value) {
                        email = value;
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Flexible(
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      obscureText: true,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: kTextFieldPasswordDecoration,
                      onChanged: (value) {
                        password = value;
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                  color: Colors.teal,
                  onPressed: () async {
                    try {
                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                              email: email, password: password);

                      User user = newUser.user;

                      if (newUser != null) {
                        await DatabaseService(uid: user.uid)
                            .updateUserData(120, 37.6, 27.2048, 77.4975);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Dashboard();
                        }));
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: Text('Sign Up'),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.teal,
                      width: 1,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
