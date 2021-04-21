import 'package:flutter/material.dart';
import 'package:planner_app/screens/home/pages.dart';


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