import 'package:flutter/material.dart';
import 'package:planner_app/models/NoteData.dart';
import 'package:provider/provider.dart';
import 'noteElements.dart';

class NoteList extends StatefulWidget {
  final String uid, noteID;
  NoteList({this.uid, this.noteID});

  @override
  _NoteListState createState() => _NoteListState(uid: uid, noteID: noteID);
}

class _NoteListState extends State<NoteList> {
  final String uid, noteID;
  _NoteListState({this.uid, this.noteID});

  @override
  Widget build(BuildContext context) {
    List<NoteData> notes = Provider.of<List<NoteData>>(context);

    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, index) {
        if (notes != null || notes.length != 0){
          if (notes[index].type == 'header') {
            return Header(val: notes[index].val);
          }
          else if (notes[index].type == 'paragraph') {
            return Paragraph(val: notes[index].val);
          }
          else {
            return BulletPoint(val: notes[index].val);
          }
        }
        else {
          return Text('Add some notes!');
        }
      }
    );
  }
}