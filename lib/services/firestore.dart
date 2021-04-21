import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:planner_app/models/PageData.dart';


class FireStoreService {

  String uid;
  FireStoreService({this.uid});

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  List<PageData> _getPageData (QuerySnapshot snapshot) {
      return snapshot.docs.map<PageData>((doc) {
        return PageData(
          docRef: doc.id ?? 'something went wrong and I dont know why', 
          title: doc.get('name') ?? 'name doesnt exist', 
          dateCreated: doc.get('dateCreated') ?? 'dateeee', 
          type: doc.get('type') ?? 'nothing is working',
        );
      }).toList();
  }

  Stream<List<PageData>> get pages {
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
      await _db.collection('users').doc(uid).collection('pages').doc('${Timestamp.now().toDate()}').set({
        'type': pageType,
        'dateCreated': Timestamp.now(),
        'title': title
        }
      );
    }
    catch (e) {
      print(e);
    }
  }

}