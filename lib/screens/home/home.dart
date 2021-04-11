import 'package:flutter/material.dart';
import 'package:planner_app/screens/home/pages.dart';

import 'daily.dart';
import 'notes.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Pages();
  }
}