// page in the app that displays all a running list of the pages added to the virtual journal
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:planner_app/screens/home/PageList/PageList.dart';
import 'package:planner_app/services/auth.dart';
import 'package:planner_app/services/firestore.dart';
import 'package:provider/provider.dart';
import 'package:planner_app/models/PageData.dart';

class Pages extends StatefulWidget {
  @override
  _PagesState createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  final AuthService _auth = AuthService();
  
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    return StreamProvider<List<PageData>>.value(
      initialData: [],
      value: FireStoreService(uid: user.uid).pages,
      builder: (context, snapshot) {
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(child: Text('my Pages')),
              Expanded(
                child: PageList()
                
              ),
            ]
          ),
          floatingActionButton: PopupMenuButton(
              icon: Icon(Icons.add),
              onSelected: (val) async {
                await FireStoreService(uid: user.uid).addPage(val);
                print(val);
              },
              color: Colors.pink[100],
              itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                PopupMenuItem(
                  child: Row(children: [Icon(Icons.sticky_note_2_outlined), Text('notes')]),
                  value: 'notes',
                ),
                PopupMenuItem(
                  child: Row(children: [Icon(Icons.assignment_outlined), Text('daily')]),
                  value: 'daily',
                ),
                PopupMenuItem(
                  child: Row(children: [Icon(Icons.event_available_outlined), Text('habit?')]),
                  value: 'habit?',
                ),
              ]

            )
          );
      }
    );
  }
}