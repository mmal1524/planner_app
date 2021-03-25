import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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