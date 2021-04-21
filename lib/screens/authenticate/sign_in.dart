import 'package:flutter/material.dart';
import 'package:planner_app/services/auth.dart';

class SignIn extends StatefulWidget {
  final Function changeView;
  SignIn({this.changeView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
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
                    _auth.signIn(email, password);
                    
                  },
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Need an account?'),
                TextButton(onPressed: widget.changeView, child: Text('Sign Up!'))
              ],
            )
          ],
        ),
      )
      );
  }
}