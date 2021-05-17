import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String val;
  Header({this.val});

  @override
  Widget build(BuildContext context) {
    return Text(
      '$val',
      style: Theme.of(context).textTheme.headline6.copyWith(fontWeight: FontWeight.normal)
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
      style: Theme.of(context).textTheme.subtitle1.copyWith(fontSize: 16)
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
        SizedBox(width: 10),
        Icon(
          Icons.circle,
          size: 6,
        ),
        SizedBox(width: 10),
        Text(
          '$val',
          style: Theme.of(context).textTheme.subtitle1.copyWith(fontSize: 16)
        )
      ]
    );
  }
}