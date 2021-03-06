import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:planner_app/models/NoteData.dart';
import 'package:planner_app/models/PageData.dart';
import 'package:planner_app/models/taskData.dart';


class FireStoreService {

  String uid;
  FireStoreService({this.uid});

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // https://www.youtube.com/watch?v=ggYTQn4WVuw&list=PL4cUxeGkcC9j--TKIdkb3ISfRbJeJYQwC&index=19
  // Stream implementation from Net Ninja tutorial
  List<PageData> _getPageData (QuerySnapshot snapshot) {
    return snapshot.docs.map<PageData>((doc) {
      return PageData(
        docRef: doc.id ?? 'something went wrong', 
        title: doc.data()['title'] ?? 'title', 
        dateCreated: doc.data()['dateCreated'] ?? 'date', 
        type: doc.data()['type'] ?? 'type',
      );
    }).toList();
  }

  Stream<List<PageData>> get pages {
    print( _db.collection('users').doc('$uid').collection('pages').snapshots().length);
    return _db.collection('users').doc('$uid').collection('pages').snapshots().map(_getPageData);
  }

  List<TaskData> _getTaskData (QuerySnapshot snapshot) {
    return snapshot.docs.map<TaskData>((doc) {
      return TaskData(
        taskID: doc.id,
        task: doc.data()['task'] ?? 'unknown task',
        status: doc.data()['status'] ?? 'unknown status',
        notes: doc.data()['notes'] ?? '',
        deadline: doc.data()['deadline'] ?? Timestamp(0, 0)
      );
    }).toList();
  }

  Stream<List<TaskData>> getTasks(String pageID) {
    return _db.collection('users').doc('$uid').collection('pages').doc('$pageID').collection('tasks').snapshots().map(_getTaskData);
  }

  List<EventData> _getEventData (QuerySnapshot snapshot) {
    return snapshot.docs.map<EventData>((doc) {
      return EventData(
        eventID: doc.id,
        event: doc.data()['event'] ?? 'unknown task',
        status: doc.data()['status'] ?? 'unknown status',
        notes: doc.data()['notes'] ?? '',
        time: doc.data()['time'] ?? Timestamp(0, 0)
      );
    }).toList();
  }

  Stream<List<EventData>> getEvents(String pageID) {
    return _db.collection('users').doc('$uid').collection('pages').doc('$pageID').collection('events').snapshots().map(_getEventData);
  }

  List<NoteData> _getNoteData (QuerySnapshot snapshot) {
    return snapshot.docs.map<NoteData>((doc) {
      return NoteData(
        type: doc.data()['noteType'] ?? 'type',
        val: doc.data()['noteVal'] ?? 'value',
      );
    }).toList();
  }

  Stream<List<NoteData>> getNotes(String noteID) {
    return _db.collection('users').doc('$uid').collection('pages').doc('$noteID').collection('notes').orderBy('noteNum').snapshots().map(_getNoteData);
  }

  changeTaskStatus(String newStatus, pageID, taskID){
    _db.collection('users').doc('$uid').collection('pages').doc('$pageID').collection('tasks').doc('$taskID').update({
        'status': newStatus
      }
    );
    print('change status to $newStatus for uid: $uid with pageID: $pageID and taskID: $taskID');
  }

  changeEventStatus(String newStatus, pageID, eventID){
    _db.collection('users').doc('$uid').collection('pages').doc('$pageID').collection('events').doc('$eventID').update({
        'status': newStatus
      }
    );
    print('change status to $newStatus for uid: $uid with pageID: $pageID and taskID: $eventID');
  }

  Future createUser(String uid, String email, String username) async {
    try {
      await _db.collection('users').doc(uid).set({'email': '$email', 'username': username});
    }
    catch (e) {
      print(e);
    }
  }

  Future addTask(String pageID, String task, DateTime deadline, String notes) async {
    print('uid: $uid, pageID: $pageID');

    try{
      await _db.collection('users').doc(uid).collection('pages').doc(pageID).collection('tasks').doc('${TimeOfDay.now()}').set({        
        'task': task,
        'deadline': deadline,
        'notes': notes,
        'status': 'to-do',
      });
    }
    catch (e) {
      print(e);
    }
  }

  Future addEvent(String pageID, String event, TimeOfDay time, String location) async {
    try {
       await _db.collection('users').doc(uid).collection('pages').doc(pageID).collection('events').doc('${TimeOfDay.now()}').set({
        'event': event,
        'time': Timestamp.fromDate(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, time.hour, time.minute, 0, 0, 0)),
        'status': 'to-do',
        'location': location,
      });
    }
    catch (e) {
      print(e);
    }
  }

  Future addNote(String title, String noteID, List<String> noteVals, List<String> noteTypes) async {
    try {
      await _db.collection('users').doc(uid).collection('pages').doc(noteID).update({'title': title});
      for (var i = 0; i < noteVals.length; i++) {
        await _db.collection('users').doc(uid).collection('pages').doc(noteID).collection('notes').doc('note$i').set({
          'noteVal': noteVals[i],
          'noteType': noteTypes[i],
          'noteNum': i,
        });
      }
       
    }
    catch (e) {
      print(e);
    }
  }

  Future addPage(String pageType) async {
    //MyUser currentU = AuthService().getCurrentUser;
    //String uid = currentU.uid;
    print(uid);
    String title;
    if (pageType == 'daily') {
      title = DateTime.now().toString();
    }
    else{
      title = 'Untitled Note';
    }

    try{
      await _db.collection('users').doc('$uid').collection('pages').doc('${Timestamp.now().toDate()}').set({
        'type': pageType,
        'dateCreated': Timestamp.now().toDate(),
        'title': title
        }
      );
    }
    catch (e) {
      print(e);
    }
  }

  

}