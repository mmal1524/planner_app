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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Date of Note?'),
                Text('Day of the week?'),
                ]
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                
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
                ),
              ),
            ],
          ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add_rounded)
        ),
      );
  }
}