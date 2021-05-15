import 'package:flutter/material.dart';
import 'package:planner_app/services/firestore.dart';

class NoteForm extends StatefulWidget {
  final String uid, noteID;
  NoteForm({this.uid, this.noteID});

  @override
  _NoteFormState createState() => _NoteFormState(uid: uid, noteID: noteID);
}

class _NoteFormState extends State<NoteForm> {
  final uid, noteID;
  _NoteFormState({this.uid, this.noteID});
  
  String title = '';
  List<Widget> noteElements = [];
  List<String> noteVals = [];
  List<String> noteTypes = [];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Note Title'),
            onChanged: (val) {
              setState(() => title = val);
            },
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    noteVals = [... noteVals, ''];
                    noteTypes = [... noteTypes, 'header'];
                    noteElements = [...noteElements, 
                    TextField(
                      decoration: InputDecoration(labelText: 'header'),
                      onChanged: (val) {
                      }
                    )];
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
                    noteElements = [...noteElements, 
                    TextField(
                      minLines: 1,
                      maxLines: 20,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(labelText: 'paragraph'),
                      onChanged: (val) {}
                    )];
                  });
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
              return TextField(
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
            // child: ListView(
            //   children: noteElements,
            // ),
          ),
          OutlinedButton(
            onPressed: (){
              print('$title, $noteID, $noteVals, $noteTypes');
              FireStoreService(uid: uid).addNote(title, noteID, noteVals, noteTypes);
              Navigator.pop(context);
            }, 
            child: Text('Submit')
          )
        ],
      ),
    );
  }
}