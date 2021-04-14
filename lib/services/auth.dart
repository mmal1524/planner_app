import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;


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
      _db.collection('users').doc(user.uid).set({'email': '$email', 'username': username});
      print('${user.uid} signed in');
    }
    catch (e) {
      print(e);
    }
  }

  Future signIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      print('${user.uid} signed in');
    }
    catch (e) {
      print(e);
    } 
  }

  Future signOutUser() async {
    try {
      print('user signed out');
      return await _auth.signOut();
    }
    catch (e) {
      print(e.toString());
      return null;
    }
  }

}