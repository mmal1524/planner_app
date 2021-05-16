import 'package:flutter/material.dart';
import 'package:planner_app/screens/home/dailyRenders/basicDaily.dart';
import 'package:planner_app/screens/home/notes.dart';
import 'package:planner_app/models/PageData.dart';
import 'package:intl/intl.dart';




class PageTile extends StatelessWidget {
  final PageData page;
  final String uid;
  PageTile({this.page, this.uid});
  
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: page.type == 'daily' ? Text('${DateFormat.yMMMMd('en_US').format(page.dateCreated.toDate())}') : Text('${page.title}'),
      leading: page.type == 'daily' ? Icon(Icons.assignment_outlined) : Icon(Icons.sticky_note_2_outlined),
      subtitle: page.type == 'notes' ? Text('Date Created: ${DateFormat.yMd().add_jm().format(page.dateCreated.toDate())}') : Text(''),
      onTap: () {
        if (page.type == 'daily') {
        //print(DateFormat.yMMMd().format(DateTime.now()));

          Navigator.push(context, MaterialPageRoute(builder: (context) {return BasicDaily(uid: uid, page: page);}));
        }
        else {
          Navigator.push(context, MaterialPageRoute(builder: (context) {return Notes(uid: uid, page: page);}));
          print(page.docRef);
        }
      },
    );
  }
}