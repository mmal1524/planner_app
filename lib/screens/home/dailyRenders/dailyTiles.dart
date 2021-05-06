import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String task, notes;
  final Timestamp deadline;
  TaskTile({this.task, this.notes, this.deadline});
  
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.circle),
          ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
            child: Column(
              children: [
                Text('$task'), 
                SizedBox(height: 10),
                Text('$notes')
                ],
              crossAxisAlignment: CrossAxisAlignment.start,
              ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
          child: Text(
            'Due date?'
            ),
        )
      ],
    );
  }
}