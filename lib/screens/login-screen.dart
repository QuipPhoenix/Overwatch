import 'package:flutter/material.dart';
import 'package:overwatch/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dashboard.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email;
  String password;
  bool loginFail = false;
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('LogIn'),
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
                      final user = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      if (user != null) {
                        loginFail = false;
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Dashboard();
                        }));
                      } else {
                        loginFail = true;
                        print('incorrect login credentials');
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: Text('Log In'),
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
