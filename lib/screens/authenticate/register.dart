// register page widget
import 'package:flutter/material.dart';
import 'package:planner_app/services/auth.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String email = '';
  String password = '';

  final AuthService _auth = new AuthService();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('myPlan')),
        ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'email'),
              onChanged: (val) {
                setState(() => email = val);
              }
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(labelText: 'password'),
              onChanged: (val) {
                setState(() => password = val);
              }
            ),
            SizedBox(height: 10),
            // ignore: missing_required_param
            ElevatedButton(
              child: Text('Sign Up'),
              onPressed: (){
                print('email: $email, password: $password');
                _auth.signUp(email, password, "name");
              },
              
              )
          ],
        ),
      )
      );
  }
}