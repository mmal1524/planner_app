import 'package:flutter/material.dart';
import 'package:planner_app/screens/home/dailyRenders/basicDaily.dart';

class Daily extends StatefulWidget {
  @override
  _DailyState createState() => _DailyState();
}

class _DailyState extends State<Daily> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Daily Page'
          ),
        centerTitle: true,
        ),
        body: BasicDaily(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add_rounded)
        ),
      );
  }
}