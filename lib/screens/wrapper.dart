// wrapper for auth and actual app
// if logged in, displays the actual app with correct info and if not, displays sign in/up info
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:planner_app/screens/authenticate/authenticate.dart';
import 'package:planner_app/screens/home/home.dart';
import 'package:planner_app/services/auth.dart';
import 'package:provider/provider.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Stream Provider code from https://www.youtube.com/watch?v=_Sa60ZxFgSI

    User _user = Provider.of<User>(context);
    if (_user == null){
      print("login/signup page"); 
      return Authenticate();
    }
    else {
      print("homepage, ${_user.uid}"); 
      return Home();
    }
  }
}