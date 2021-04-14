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
  bool haveAccount = false;
  
  // https://www.youtube.com/watch?v=E-DRnRUXcBY&list=PL4cUxeGkcC9j--TKIdkb3ISfRbJeJYQwC&index=11
  void changeView() {
    setState(() => haveAccount = !haveAccount);
  }

  @override
  Widget build(BuildContext context) {
    if (haveAccount) {
      return SignIn(changeView: changeView);
    }
    else {
      return SignUp(changeView: changeView);
    }
  }
}