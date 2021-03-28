// page in the app that displays all a running list of the pages added to the virtual journal
import 'package:flutter/material.dart';

class Pages extends StatefulWidget {
  @override
  _PagesState createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('myPlan?')
      ),
      body: Column(
        children: [
          Center(child: Text('my Pages')),
          Center(
            child: Card(
              margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              
              child: Column(
                
                children: [
                  Text('Page Title'), 
                  Text('date created'),
                ],
              )
            ),
          )  
        ]
      )

    );
  }
}