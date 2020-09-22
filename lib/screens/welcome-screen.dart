import 'package:flutter/material.dart';
import 'login-screen.dart';
import 'signup-screen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      //crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: AssetImage('assets/logo.png'),
          width: 200.0,
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(
          'OVERWATCH',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0),
        ),
        SizedBox(
          height: 15.0,
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: FlatButton(
            color: Colors.teal,
            onPressed: () async {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return LoginScreen();
              }));
            },
            child: Text(
              'Log In',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            shape: RoundedRectangleBorder(
                side: BorderSide(
                    color: Colors.teal, width: 1, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(50)),
          ),
        ),
        SizedBox(
          height: 15.0,
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: FlatButton(
            color: Colors.teal,
            onPressed: () async {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SignupScreen();
              }));
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
          ),
        ),
      ],
    ));
  }
}
