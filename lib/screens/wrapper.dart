// wrapper for auth and actual app
// if logged in, displays the actual app with correct info and if not, displays sign in/up info
import 'package:flutter/material.dart';
import 'package:planner_app/screens/authenticate/authenticate.dart';
import 'package:planner_app/screens/home/home.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool loggedIn = false;
    if (loggedIn) {
      return Home();
    }
    else {
      return Authenticate();
    }
  }
}