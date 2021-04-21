import 'package:flutter/material.dart';
import 'package:planner_app/screens/home/PageList/pageTile.dart';
import 'package:planner_app/models/PageData.dart';
import 'package:provider/provider.dart';

class PageList extends StatefulWidget {
  @override
  _PageListState createState() => _PageListState();
}

class _PageListState extends State<PageList> {
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
            child: PageTile(title: pages[index].type, dateCreated: pages[index].dateCreated, type: pages[index].type, docRef: pages[index].docRef),
          );
        }
      );
    }
    else {
      return Text('You currently do not have any pages. Try adding one by tapping the + icon in the corner');
    }
  }
}
