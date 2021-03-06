import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:planner_app/models/taskData.dart';
import 'TaskForm.dart';
import 'package:planner_app/services/firestore.dart';
import 'package:intl/intl.dart';

class TaskTile extends StatelessWidget {
  final TaskData task;
  final String uid, pageID;
  TaskTile({this.task, this.uid, this.pageID});
  
  final List<String> statOptions = ['to-do', 'done', 'move', 'cancel'];

  @override
  Widget build(BuildContext context) {
    String status = task.status;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        IconButton(
          onPressed: () {
            int index = statOptions.indexOf(status);
            if (index + 1 < statOptions.length) {
              FireStoreService(uid: uid).changeTaskStatus(statOptions[index + 1], pageID, task.taskID);
            }
            else FireStoreService(uid: uid).changeTaskStatus(statOptions[0], pageID, task.taskID);

          },
          icon: status == 'to-do' ? Icon(Icons.circle) : status == 'done' ? Icon(Icons.done) : status == 'move' ? Icon(Icons.arrow_forward_ios_sharp) : Icon(Icons.horizontal_rule),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
            child: Column(
              children: [
                Text('${task.task}', style: Theme.of(context).textTheme.subtitle1), 
                SizedBox(height: 10),
                Text('${task.notes}')
                ],
              crossAxisAlignment: CrossAxisAlignment.start,
              ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
          child: Text(
            '${DateFormat.yMd().add_jm().format(task.deadline.toDate())}'
          ),
        ), 
        IconButton(
          onPressed: (){
            showModalBottomSheet(
              context: context, 
              builder: (context) {
              //print('page Id: ${page.docRef}, uid: $uid');
              return DailyForm(docRef: pageID, uid: uid,);
              }
            );
          },
          icon: Icon(Icons.more_vert_sharp)
        )
      ],
    );
  }
}

class EventTile extends StatelessWidget {
  final EventData event;
  final String uid, pageID;
  EventTile({this.event, this.uid, this.pageID});
  
  final List<String> statOptions = ['to-do', 'cancel'];

  @override
  Widget build(BuildContext context) {
    String status = event.status;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        IconButton(
          onPressed: () {
            int index = statOptions.indexOf(status);
            if (index + 1 < statOptions.length) {
              FireStoreService(uid: uid).changeEventStatus(statOptions[index + 1], pageID, event.eventID);
            }
            else FireStoreService(uid: uid).changeEventStatus(statOptions[0], pageID, event.eventID);

          },
          icon: status == 'to-do' ? Icon(Icons.lens_outlined) : Icon(Icons.remove_circle_outline_outlined),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
            child: Column(
              children: [
                Text('${event.event}', style: Theme.of(context).textTheme.subtitle1), 
                SizedBox(height: 10),
                Text('${event.notes}')
                ],
              crossAxisAlignment: CrossAxisAlignment.start,
              ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
          child: Text(
            '${DateFormat.yMd().add_jm().format(event.time.toDate())}'
          ),
        ), 
        IconButton(
          onPressed: (){
            showModalBottomSheet(
              context: context, 
              builder: (context) {
              //print('page Id: ${page.docRef}, uid: $uid');
              return DailyForm(docRef: pageID, uid: uid,);
              }
            );
          },
          icon: Icon(Icons.more_vert_sharp)
        )
      ],
    );
  }
}