import 'package:flutter/material.dart';
import 'package:planner_app/screens/home/PageList/pageTile.dart';
import 'package:planner_app/models/PageData.dart';
import 'package:provider/provider.dart';

class PageList extends StatefulWidget {
  final String uid;
  PageList({this.uid});

  @override
  _PageListState createState() => _PageListState();
}

class _PageListState extends State<PageList> {
  final String uid;
  _PageListState({this.uid});
  
  @override
  Widget build(BuildContext context) {

    List<PageData> pages = Provider.of<List<PageData>>(context);
    pages.forEach((page) {
      print('${page.title} + ${page.dateCreated} + ${page.type}');
    });
    print(pages.length);
    if (pages != null && pages.length != 0) {
      return ListView.builder(
        itemCount: pages.length,
        itemBuilder: (context, index) {
          return Card(
            child: PageTile(page: pages[index], uid: uid),
          );
        }
      );
    }
    else {
      return Text('You currently do not have any pages. Try adding one by tapping the + icon in the corner');
    }
  }
}
