import 'package:flutter/material.dart';
import 'package:planner_app/screens/home/dailyRenders/dailyTiles.dart';
import 'package:provider/provider.dart';
import 'package:planner_app/models/taskData.dart';

class TaskList extends StatefulWidget {
  final String uid, pageID;
  TaskList({this.uid, this.pageID});

  @override
  _TaskListState createState() => _TaskListState(uid: uid, pageID: pageID);
}

class _TaskListState extends State<TaskList> {
  final String uid, pageID;
  _TaskListState({this.uid, this.pageID});
  
  

  @override
  Widget build(BuildContext context) {
    print('open task list, uid: $uid, pageID, $pageID');
    List<TaskData> tasks = Provider.of<List<TaskData>>(context);
    
    if (tasks != null && tasks.length != 0) {
      return ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return Expanded(
            child: TaskTile(task: tasks[index], uid: uid, pageID: pageID),
          );
        }
      );
    }
    else {
      return Text('You currently do not have any tasks. Try adding one by tapping the + icon in the corner');
    }
  }
}

class EventList extends StatefulWidget {
  final String uid, pageID;
  EventList({this.uid, this.pageID});

  @override
  _EventListState createState() => _EventListState(uid: uid, pageID: pageID);
}

class _EventListState extends State<EventList> {
  final String uid, pageID;
  _EventListState({this.uid, this.pageID});
  
  

  @override
  Widget build(BuildContext context) {
    print('open task list, uid: $uid, pageID, $pageID');
    List<EventData> events = Provider.of<List<EventData>>(context);
    
    if (events != null && events.length != 0) {
      return ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          return Expanded(
            child: EventTile(event: events[index], uid: uid, pageID: pageID),
          );
        }
      );
    }
    else {
      return Text('You currently do not have any tasks. Try adding one by tapping the + icon in the corner');
    }
  }
}