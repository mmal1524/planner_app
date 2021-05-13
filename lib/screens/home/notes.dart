import 'package:flutter/material.dart';
import 'package:planner_app/screens/home/notes/noteForm.dart';

class Notes extends StatefulWidget {
  final String uid, noteID;
  Notes({this.uid, this.noteID});

  @override
  _NotesState createState() => _NotesState(uid: uid, noteID: noteID);
}

class _NotesState extends State<Notes> {
  final String uid, noteID;
  _NotesState({this.uid, this.noteID});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notes'
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            decoration: InputDecoration(hintText: 'title'),
            minLines: 1,
            maxLines: 1,
            onChanged: (val) {},
            ),
          TextField(
            controller: TextEditingController(text: 'This is text. Click to edit?'),
            onChanged: (val) {},
            )
          ],
      ),
      floatingActionButton: IconButton(
        icon: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return NoteForm(uid: uid, noteID: noteID);
            }
          );
        },
      ),
    );
  }
}