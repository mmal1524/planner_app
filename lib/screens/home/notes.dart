import 'package:flutter/material.dart';
import 'package:planner_app/models/NoteData.dart';
import 'package:planner_app/models/PageData.dart';
import 'package:planner_app/screens/home/notes/noteForm.dart';
import 'package:planner_app/screens/home/notes/noteList.dart';
import 'package:planner_app/services/firestore.dart';
import 'package:provider/provider.dart';

class Notes extends StatefulWidget {
  final String uid;
  final PageData page;
  Notes({this.uid, this.page});

  @override
  _NotesState createState() => _NotesState(uid: uid, page: page);
}

class _NotesState extends State<Notes> {
  final String uid;
  final PageData page;
  _NotesState({this.uid, this.page});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notes'
        ),
        centerTitle: true,
      ),
      body: StreamProvider<List<NoteData>>.value(
        initialData: [],
        value: FireStoreService(uid: uid).getNotes(page.docRef),
        child: Column(
          children: [
            Text('${page.title}'),
            Expanded(
              child: NoteList()
            ),
          ]
        )
      ),
      floatingActionButton: IconButton(
        icon: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return NoteForm(uid: uid, noteID: page.docRef);
            }
          );
        },
      ),
    );
  }
}