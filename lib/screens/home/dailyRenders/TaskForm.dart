import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TaskForm extends StatefulWidget {
  @override
  _TaskFormState createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
 
  @override 
  Widget build(BuildContext context) {
    String taskLabel = 'task';
    String dateLabel = 'deadline';
    String dropdownVal = 'Task';

    String task = '';
    DateTime date = DateTime.now();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // https://api.flutter.dev/flutter/material/DropdownButton-class.html
          // Implementation of Dropdown menu from documentation
          DropdownButton<String>(
            value: dropdownVal,
            onChanged: (String newValue) {
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
          TextField(
            decoration: InputDecoration(labelText: '$taskLabel'),
            onChanged: (val) {
              setState(() => task = val);
            },
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.calendar_today_outlined), 
                onPressed: () {
                  showDatePicker(
                    context: context, 
                    initialDate: Timestamp.now().toDate(),
                    firstDate: Timestamp.now().toDate(),
                    lastDate: Timestamp.now().toDate().add(Duration(days: 365)),
                  ).then((value) {setState(() => date = value);});
                }
              ),
              Text('${date.toString()}')
            ],
          ),
          // CalendarDatePicker(
          //   initialDate: Timestamp.now().toDate(),
          //   firstDate: Timestamp.now().toDate(),
          //   lastDate: Timestamp.now().toDate().add(Duration(days: 365)), 
          //   onDateChanged: (inputDate) {
          //     setState(() => date = inputDate);
          //   }
          // )
          // InputDatePickerFormField(
          //   initialDate: Timestamp.now().toDate(),
          //   firstDate: Timestamp.now().toDate(),
          //   lastDate: Timestamp.now().toDate().add(Duration(days: 365)),
          
          // )
        ],
      ),
    );
  }
}

