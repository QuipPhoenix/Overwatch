import 'package:flutter/material.dart';
import 'screens/loading_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Overwatch());
}

class Overwatch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            brightness: Brightness.dark,
            inputDecorationTheme: InputDecorationTheme()),
        debugShowCheckedModeBanner: false,
        home: LoadingScreen());
  }
}
