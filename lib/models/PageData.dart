import 'package:cloud_firestore/cloud_firestore.dart';

class PageData {
  String title, type;
  Timestamp dateCreated;
  String docRef;
  
  PageData({this.title, this.type, this.dateCreated, this.docRef});

  @override
  String toString() {
    return 'type:$type, title: $title';
  }
}