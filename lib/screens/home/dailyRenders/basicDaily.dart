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
            Text('Day of the week?'),
            ]
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            
            children: [
              ListTile(
                leading: IconButton(
                  icon: Icon(Icons.circle),
                  onPressed: () {},
                  ),
                title: Text('Task 1 To Do'),
                trailing: Text('Due Date'),
                subtitle: Text('notes?'),
                isThreeLine: true,
                
                ),
              ListTile(
                leading: IconButton(
                  icon: Icon(Icons.close_sharp),
                  onPressed: () {},
                  ),
                title: Text('Task 2 Done'),
                ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.circle),
                        ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
                          child: Column(
                            children: [
                              Text('Task 3 to do'), 
                              SizedBox(height: 10),
                              Text('notes notes notes notes notes notes notes notes notes notes notes notes notes notes notes notes notes notes notes notes')
                              ],
                            crossAxisAlignment: CrossAxisAlignment.start,
                            ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                        child: Text(
                          'Due date?'
                          ),
                      )
                      ],
                    ),
                ),
              ),
              ],
            ),
          ),
        ],
      );
  }
}
