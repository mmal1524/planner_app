// this page serves as a wrapper for the authentication pages
// will display either the sign in page widget or the register page widget
import 'package:flutter/material.dart';
import 'package:planner_app/screens/authenticate/sign_in.dart';
import 'package:planner_app/screens/authenticate/register.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return SignIn();
  }
}