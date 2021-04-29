import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:planner_app/services/firestore.dart';

class DailyForm extends StatefulWidget {
  final String uid, docRef;
  DailyForm({this.uid, this.docRef});

  @override
  _DailyFormState createState() => _DailyFormState(uid: uid, docRef: docRef);
}

class _DailyFormState extends State<DailyForm> {
  String uid, docRef;
  _DailyFormState({this.uid, this.docRef});
  
  String taskLabel = 'task';
  String dateLabel = 'deadline';
  String dropdownVal = 'Task';

  String task = '';
  DateTime date;

  @override 
  Widget build(BuildContext context) {
    

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // https://api.flutter.dev/flutter/material/DropdownButton-class.html
          // Implementation of Dropdown menu from documentation
          DropdownButton<String>(
            value: dropdownVal,
            onChanged: (String newValue) {
              if (newValue == 'Task'){
                setState(() {
                  dropdownVal = newValue;
                  taskLabel = 'task';
                  dateLabel = 'Deadline';
                });
              }
              else {
                setState(() {
                  dropdownVal = newValue;
                  taskLabel = 'event';
                  dateLabel = 'Time';
                });
              }
              
            },
            items: <String>['Task', 'Event']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          TextField(
            decoration: InputDecoration(labelText: '$taskLabel'),
            onChanged: (val) {
              setState(() => task = val);
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('$dateLabel'),
              date != null ? Text('${date.toString()}') : Text('insert deadline'),
              IconButton(
                icon: Icon(Icons.calendar_today_outlined), 
                onPressed: () {
                  showDatePicker(
                    context: context, 
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(Duration(days: 365)),
                    
                  ).then((d) {
                    showTimePicker(
                      context: context, 
                      initialTime: TimeOfDay.now()
                    ).then((t) {
                      setState(() => date = d.add(Duration(hours: t.hour, minutes: t.minute)));
                    });
                  });
                }
              ),
            ],
          ),
          OutlinedButton(
            onPressed: (){
              FireStoreService(uid: uid).addTask(docRef, task, date);
            }, 
            child: Text('Submit')
          )
        ],
      ),
    );
  }
}

class TaskForm extends StatefulWidget {
  final String uid, docRef;
  TaskForm({this.uid, this.docRef});

  @override
  _TaskFormState createState() => _TaskFormState(uid: uid, docRef: docRef);
}

class _TaskFormState extends State<TaskForm> {
  String uid, docRef;
  _TaskFormState({this.uid, this.docRef});
  
  String task = '';
  DateTime deadline;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
            decoration: InputDecoration(labelText: 'task'),
            onChanged: (val) {
              setState(() => task = val);
            },
          ),
          Row(
            children: [
              Text('deadline'),
              SizedBox(width: 20),
              Expanded(
                child: deadline != null ? Text('${deadline.toString()}') : Text('insert deadline')
              ),
              IconButton(
                icon: Icon(Icons.calendar_today_outlined), 
                onPressed: () {
                  showDatePicker(
                    context: context, 
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(Duration(days: 365)),
                    
                  ).then((d) {
                    showTimePicker(
                      context: context, 
                      initialTime: TimeOfDay.now()
                    ).then((t) {
                      setState(() => deadline = d.add(Duration(hours: t.hour, minutes: t.minute)));
                    });
                  });
                }
              ),
            ],
          ),
          OutlinedButton(
            onPressed: (){
              FireStoreService(uid: uid).addTask(docRef, task, deadline);
            }, 
            child: Text('Submit')
          )
      ]
    );
  }
}