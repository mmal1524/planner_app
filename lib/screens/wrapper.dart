// wrapper for auth and actual app
// if logged in, displays the actual app with correct info and if not, displays sign in/up info
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:planner_app/screens/authenticate/authenticate.dart';
import 'package:planner_app/screens/home/home.dart';
import 'package:planner_app/services/auth.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  final FirebaseAuth _auth = FirebaseAuth.instance; 


  bool loggedIn = false; 

  if (loggedIn) {
      print("change to home");
      return Home();
    }
    else {
      return Authenticate();
      
    }
    
  }
}