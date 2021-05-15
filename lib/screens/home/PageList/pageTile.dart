import 'package:flutter/material.dart';
import 'package:planner_app/screens/home/dailyRenders/basicDaily.dart';
import 'package:planner_app/screens/home/notes.dart';
import 'package:planner_app/models/PageData.dart';




class PageTile extends StatelessWidget {
  final PageData page;
  final String uid;
  PageTile({this.page, this.uid});
  
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('${page.title}'),
      leading: page.type == 'daily' ? Icon(Icons.assignment_outlined) : Icon(Icons.sticky_note_2_outlined),
      subtitle: Text('Date Created: ${page.dateCreated.toDate()}'),
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