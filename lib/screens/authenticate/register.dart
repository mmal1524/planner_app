// register page widget
import 'package:flutter/material.dart';
import 'package:planner_app/services/auth.dart';

class SignUp extends StatefulWidget {
  final Function changeView;
  SignUp({this.changeView});
  
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String email = '';
  String password = '';
  String username = '';

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
                TextField(
                  decoration: InputDecoration(labelText: 'username'),
                  onChanged: (val) {
                    setState(() => username = val);
                  }
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  child: Text('Sign Up'),
                  onPressed: (){
                    print('email: $email, password: $password');
                    _auth.signUp(email, password, username);
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Have an account?'),
                TextButton(onPressed: widget.changeView, child: Text('Login!'))
              ],
            )
          ],
        ),
      ),
      
    );
  }
}