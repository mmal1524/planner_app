import 'package:flutter/material.dart';
import 'package:planner_app/models/PageData.dart';
import 'package:planner_app/models/taskData.dart';
import 'package:planner_app/screens/home/dailyRenders/TaskForm.dart';
import 'package:planner_app/screens/home/dailyRenders/TaskList.dart';
import 'package:planner_app/services/firestore.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';



class BasicDaily extends StatefulWidget {
  final String uid;
  final PageData page;
  BasicDaily({this.uid, this.page});

  @override
  _BasicDailyState createState() => _BasicDailyState(uid: uid, page: page);

}

class _BasicDailyState extends State<BasicDaily> {
  final String uid;
  final PageData page;
  _BasicDailyState({this.uid, this.page});


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Page!'),
      ),
      body: StreamProvider<List<TaskData>>.value(
        initialData: [],
        value: FireStoreService(uid: uid).getTasks(page.docRef),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${DateFormat.EEEE('en_US').format(page.dateCreated.toDate())}', style: Theme.of(context).textTheme.headline6),
                  Text('${DateFormat.yMMMEd('en_US').format(page.dateCreated.toDate())}', style: Theme.of(context).textTheme.headline6),
                  ]
              ),
            ),
            Expanded(
              flex: 1,
              child: StreamProvider<List<EventData>>.value(
                initialData: [],
                value: FireStoreService(uid: uid).getEvents(page.docRef),
                child: EventList(pageID: page.docRef, uid: uid),
              ),
            ),
            Expanded(
              flex: 9,
              child: TaskList(uid: uid, pageID: page.docRef)
            ),
          ],
        )
      ),
      
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.playlist_add_outlined),
        onPressed: () {
          showModalBottomSheet(
            context: context, 
            builder: (context) {
              print('page Id: ${page.docRef}, uid: $uid');
              return DailyForm(docRef: page.docRef, uid: uid,);
            }
          );
        },
      ),
    );
  }
}


// Expanded(
//             child: ListView(
//               padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              
//               children: [
//                 ListTile(
//                   leading: IconButton(
//                     icon: Icon(Icons.circle),
//                     onPressed: () {},
//                     ),
//                   title: Text('Task 1 To Do'),
//                   trailing: Text('Due Date'),
//                   subtitle: Text('notes?'),
//                   isThreeLine: true,
                  
//                   ),
//                 ListTile(
//                   leading: IconButton(
//                     icon: Icon(Icons.close_sharp),
//                     onPressed: () {},
//                     ),
//                   title: Text('Task 2 Done'),
//                   ),
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.all(15.0),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisSize: MainAxisSize.max,
//                       children: [
//                         IconButton(
//                           onPressed: () {},
//                           icon: Icon(Icons.circle),
//                           ),
//                         Expanded(
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
//                             child: Column(
//                               children: [
//                                 Text('Task 3 to do'), 
//                                 SizedBox(height: 10),
//                                 Text('notes notes notes notes notes notes notes notes notes notes notes notes notes notes notes notes notes notes notes notes')
//                                 ],
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
//                           child: Text(
//                             'Due date?'
//                           ),
//                         ),
//                         IconButton(
//                           icon: Icon(Icons.more_vert),
//                           onPressed: () {}
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
