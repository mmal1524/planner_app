import 'package:firebase_auth/firebase_auth.dart';
import 'package:planner_app/services/firestore.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  //FireStoreService _db = FireStoreService();
  //MyUser currentUser = MyUser();

  //MyUser get getCurrentUser => currentUser;

  // returns a Firebase User object by checking whether there is a user logged in or not, 
  // returns the user if not null
  // code from https://www.youtube.com/watch?v=_Sa60ZxFgSI
  Stream <User> get user {
    return _auth.authStateChanges().map((User user) => user != null ? user : null); 
  }

  Future signUp(String email, String password, String username) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      //currentUser.uid = user.uid;
      //currentUser.email = email;
      
      FireStoreService(uid: user.uid).createUser(user.uid, email, username);
    }
    catch (e) {
      print(e);
    }
  }

  Future signIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      print(user);
      //currentUser.uid = user.uid;
      //currentUser.email = email;
      // if (user != null) {
      //   return MyUser(uid: user.uid, email: email);
      // } else {
      //   return null;
      // }
    }
    catch (e) {
      print(e);
    } 
  }

  Future signOutUser() async {
    try {
      print('user signed out');
      //currentUser = MyUser();
      return await _auth.signOut();
    }
    catch (e) {
      print(e.toString());
      return null;
    }
  }

}