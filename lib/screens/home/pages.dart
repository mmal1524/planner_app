// page in the app that displays all a running list of the pages added to the virtual journal
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:planner_app/services/auth.dart';

class Pages extends StatefulWidget {
  @override
  _PagesState createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('myPlan?'),
        actions: [
          IconButton(
            icon: Icon(Icons.person), 
            onPressed: () async {
              await _auth.signOutUser();
            }
          )
        ],
      ),
      body: Column(
        children: [
          Center(child: Text('my Pages')),
          Center(
            child: Card(
              margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Page Title'), 
                  Text('date created'),
                ],
              )
            ),
          )  
        ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: PopupMenuButton(
          icon: Icon(Icons.add),
          onSelected: (val) {
            if (val == 'notes') {
              print('added note');
            }
            else if (val == 'daily'){
              print('added daily');
            }
            else {
              print('added habit tracker');
            }
          },
          color: Colors.pink[100],
          itemBuilder: (BuildContext context) => <PopupMenuEntry>[
            PopupMenuItem(
              child: Icon(Icons.sticky_note_2_outlined),
              value: 'notes',
            ),
            PopupMenuItem(
              child: Icon(Icons.assignment_outlined),
              value: 'daily',
            ),
            PopupMenuItem(
              child: Icon(Icons.event_available_outlined),
              value: 'daily',
            ),
          ]

        )
      ),
    );
  }
}