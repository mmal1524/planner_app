import 'package:flutter/material.dart';
import 'package:planner_app/models/NoteData.dart';
import 'package:planner_app/models/PageData.dart';
import 'package:planner_app/services/firestore.dart';
import 'package:provider/provider.dart';

class NoteForm extends StatefulWidget {
  final String uid;
  final PageData page;
  NoteForm({this.uid, this.page});

  @override
  _NoteFormState createState() => _NoteFormState(uid: uid, page: page);
}

class _NoteFormState extends State<NoteForm> {
  final String uid;
  final PageData page;
  _NoteFormState({this.uid, this.page});
  
  List<String> noteVals = [];
  List<String> noteTypes = [];


  String title = '';
  @override
  Widget build(BuildContext context) {
    // setState(() {
    //   title = page.title;
    // });

    List<NoteData> notes = Provider.of<List<NoteData>>(context);
    
    List<String> tempVals;
    List<String> tempTypes;
    print('${notes.length}, ${noteTypes.length}');
    if (notes.length != 0 && noteTypes.length == 0) {
      tempVals = [];
      tempTypes = [];
      // setState(() {
      //   noteVals = [];
      //   noteTypes = [];
      // });
      for (var note in notes) {
        tempVals.add(note.val);
        tempTypes.add(note.type);
      }
      setState(() {
        noteVals = tempVals;
        noteTypes = tempTypes;
        // noteVals = [... noteVals, note.val];
        // noteTypes = [... noteTypes, note.type];
      });
      // for (var i = notes.length - 1; i < noteTypes.length; i++) {
      //   setState(() {
      //     noteVals = [... noteVals, note.val];
      //     noteTypes = [... noteTypes, note.type];
      //   });
      // }
      
    }
    // else if (notes.length != 0 && notes.length != noteTypes.length) {

    // }

    //print('$noteTypes, $noteVals');
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'Note Title'),
            onChanged: (val) {
              setState(() => title = val);
            },
          ),
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
        ],
      ),
    );
  }
}