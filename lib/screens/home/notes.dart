import 'package:flutter/material.dart';

class Notes extends StatefulWidget {
  @override
  _NotesState createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  @override

  

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notes for today???'
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
            controller: TextEditingController(text: 'This is text. Click to edit? Hopefully this works??'),
            onChanged: (val) {},
            )
          ],
      )
    );
  }
}