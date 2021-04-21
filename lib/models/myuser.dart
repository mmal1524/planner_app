// Needed in order to be able to easily access current user
// https://www.youtube.com/watch?v=pmRBf
class MyUser {
  String uid;
  String email;

  MyUser({this.uid, this.email});

  @override
  String toString() {
    return '$email has signed in with id $uid';
  }
}