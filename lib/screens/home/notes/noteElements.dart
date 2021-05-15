import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String val;
  Header({this.val});

  @override
  Widget build(BuildContext context) {
    return Text(
      '$val',
      style: TextStyle(fontSize: 20),
    );
  }
}

class Paragraph extends StatelessWidget {
  final String val;
  Paragraph({this.val});

  @override
  Widget build(BuildContext context) {
    return Text(
      '$val',
      style: TextStyle(fontSize: 14),
    );
  }
}

class BulletPoint extends StatelessWidget {
  final String val;
  BulletPoint({this.val});

  @override
  Widget build(BuildContext context) {
    return Row(
      children:[
        Icon(
          Icons.circle,
          size: 14,
        ),
        Text(
          '$val',
          style: TextStyle(fontSize: 14),
        )
      ]
    );
  }
}