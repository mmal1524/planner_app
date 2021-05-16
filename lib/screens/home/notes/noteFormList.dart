import 'package:flutter/material.dart';
import 'package:planner_app/models/NoteData.dart';
import 'package:planner_app/models/PageData.dart';
import 'package:planner_app/services/firestore.dart';

class NoteFormList extends StatefulWidget {
  final List<NoteData> notes;
  final String title;
  final PageData page;
  final String uid;

  NoteFormList({this.notes, this.title, this.uid, this.page});

  @override
  _NoteFormListState createState() => _NoteFormListState();
}

class _NoteFormListState extends State<NoteFormList> {
  final List<NoteData> notes;
  final String title;
  final PageData page;
  final String uid;

  _NoteFormListState({this.notes, this.title, this.uid, this.page});

  List<String> noteTypes;
  List<String> noteVals;

  
  @override
  Widget build(BuildContext context) {
    if (notes.length != 0 && notes.length != noteTypes.length) {
      // setState(() {
      //   noteVals = [];
      //   noteTypes = [];
      // });
      for (var note in notes) {
        setState(() {
          noteVals = [... noteVals, note.val];
          noteTypes = [... noteTypes, note.type];
        });
      }
    }

    
    return Column(
      children: [
        Row(
          children: [
            TextButton(
              onPressed: () {
                print('$noteTypes, $noteVals');

                setState(() {
                  noteVals = [... noteVals, ''];
                  noteTypes = [... noteTypes, 'header'];
                });
                
                //print('noteLength =  ${noteElements.length}');
              },
              child: Text(
                '+ header'
              )
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  noteVals = [... noteVals, ''];
                  noteTypes = [... noteTypes, 'paragraph'];
                });
                print('$noteTypes, $noteVals');
              },
              child: Text(
                '+ paragraph'
              )
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                '+ list'
              )
            )
          ],
        ),
        Expanded(
          child: noteVals.length != 0 ? ListView.builder(
            itemCount: noteVals.length,
            itemBuilder: (context, index){
              return TextFormField(
                initialValue: noteVals[index],
                minLines: 1,
                maxLines: 20,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: '${noteTypes[index]}'),
                onChanged: (val) {
                  setState(() {
                    noteVals[index] = val;
                  });
                }
              );
            }
          )
          :
          Text('Add an element'),
        ),
        OutlinedButton(
          onPressed: (){
            print('$title, ${page.docRef}, $noteVals, $noteTypes');
            FireStoreService(uid: uid).addNote(title, page.docRef, noteVals, noteTypes);
            Navigator.pop(context);
          }, 
          child: Text('Submit')
        )
      ]
    );
  }
}