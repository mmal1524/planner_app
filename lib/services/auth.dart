import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signUp(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;
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

}