import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:planner_app/models/PageData.dart';


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


  Future createUser(String uid, String email, String username) async {
    try {
      await _db.collection('users').doc(uid).set({'email': '$email', 'username': username});
    }
    catch (e) {
      print(e);
    }
  }

  Future addTask(String pageID, String task, DateTime deadline) async {
    print('uid: $uid, pageID: $pageID');
    
    
    try{
      await _db.collection('users').doc(uid).collection('pages').doc(pageID).collection('tasks').add({
        'task': task,
        'deadline': deadline,
        'status': 'to-do',
      });
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