import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  
  bool isTask = true;

  String taskLabel = 'task';
  String dateLabel = 'deadline';
  String dropdownVal = 'Task';

  String task = '';
  

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
                setState(() => isTask = true);     
                print('should switch to task form');
              }
              else {
                setState(() => isTask = false);
                print('should switch to event form???');
              }
              setState(() {
                dropdownVal = newValue;
              });
            },
            items: <String>['Task', 'Event']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          isTask ? TaskForm(docRef: docRef, uid: uid) : EventForm(docRef: docRef, uid: uid), 
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
    return Expanded(
      child: ListView(
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
        ],
      ),
    );
  }
}

class EventForm extends StatefulWidget {
  final String uid, docRef;
  EventForm({this.uid, this.docRef});
  @override
  _EventFormState createState() => _EventFormState(uid: uid, docRef: docRef);
}

class _EventFormState extends State<EventForm> {
  String uid, docRef;
  _EventFormState({this.uid, this.docRef});
  
  String event = '';
  TimeOfDay time;
  String location = '';
  String notes = '';
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'event'),
            onChanged: (val) {
              setState(() => event = val);
            },
          ),
          TextField(
            decoration: InputDecoration(labelText: 'location'),
            onChanged: (val) {
              setState(() => location = val);
            },
          ),
          Row(
            children: [
              Text('time'),
              SizedBox(width: 20),
              Expanded(
                child: time != null ? Text('${time.toString()}') : Text('insert time of event')
              ),
              IconButton(
                icon: Icon(Icons.more_time_sharp), 
                onPressed: () {
                    showTimePicker(
                      context: context, 
                      initialTime: TimeOfDay.now()
                    ).then((t) {
                      setState(() => time = t);
                  });
                }
              ),
            ],
          ),
          TextField(
            decoration: InputDecoration(labelText: 'notes'),
            minLines: 1,
            maxLines: 20,
            keyboardType: TextInputType.text,
            onChanged: (val) {
              setState(() => notes = val);
            },
          ),
          OutlinedButton(
            onPressed: (){
              FireStoreService(uid: uid).addEvent(docRef, event, time);
            }, 
            child: Text('Submit')
          )
        ]
      ),
    );
  }
}