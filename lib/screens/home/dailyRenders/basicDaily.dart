import 'package:flutter/material.dart';

class BasicDaily extends StatefulWidget {
  @override
  _BasicDailyState createState() => _BasicDailyState();
}

class _BasicDailyState extends State<BasicDaily> {
  @override
  Widget build(BuildContext context) {
    return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Date of Note?'),
            Text('Day of the week?')
            ]
        ),
        ListView(
          children: [
            Card(
              child: ListTile(
                leading: IconButton(
                  icon: Icon(Icons.circle),
                  onPressed: () {},
                  ),
                title: Text('Task 1 To Do'),
                )
              ),
              Card(
              child: ListTile(
                leading: IconButton(
                  icon: Icon(Icons.close_sharp),
                  onPressed: () {},
                  ),
                title: Text('Task 2 Done'),
                )
              ),
            ],
          )
      ],
    );
  }
}
