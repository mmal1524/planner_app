import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override

  String email = '';
  String password = '';

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
              child: Text('Sign In'),
              onPressed: (){
                print('email: $email, password: $password');
              },
              
              )
          ],
        ),
      )
      );
  }
}