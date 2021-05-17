import 'package:cloud_firestore/cloud_firestore.dart';

class TaskData {
  String task, status, notes, taskID;
  Timestamp deadline;

  TaskData({this.task, this.status, this.notes, this.deadline, this.taskID});

}

class EventData {
  String event, status, location, eventID, notes;
  Timestamp time;

  EventData({this.event, this.status, this.notes, this.time, this.eventID});

}