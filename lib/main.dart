import 'package:flutter/material.dart';
import 'screens/home/home.dart';
import 'screens/home/notes.dart';
import 'screens/home/daily.dart';
import 'screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.cyan[800], 
      ),
      home: Wrapper(),
    );
  }
}
     
