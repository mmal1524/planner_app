import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



class PageTile extends StatelessWidget {
  final String title, type;
  final Timestamp dateCreated;
  final String docRef;

  PageTile({this.title, this.dateCreated, this.docRef, this.type});
  
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('$title'),
      leading: type == 'daily' ? Icon(Icons.assignment_outlined) : Icon(Icons.sticky_note_2_outlined),
      subtitle: Text('Date Created:${dateCreated.toString()}'),
    );
  }
}