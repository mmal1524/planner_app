import 'package:flutter/material.dart';
import 'package:planner_app/services/auth.dart';
import 'package:provider/provider.dart';
import 'screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

// firebase initialization from https://firebase.flutter.dev/docs/overview#initializing-flutterfire
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
 
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
 
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      initialData: null,
      value: AuthService().user,
      child: 
        FutureBuilder(
        // Initialize FlutterFire:
        future: _initialization,
        builder: (context, snapshot) {
          // Check for errors
          if (snapshot.hasError) {
            return Text('something went wrong');
          }

          // Once complete, show your application
          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              theme: ThemeData(
                primaryColor: Colors.cyan[800], 
              ),
              home: Wrapper(),
            );
          }

          // Otherwise, show something whilst waiting for initialization to complete
          return MaterialApp(
            home: Text('Loading')
          );
        },
      )
    );
    
   
    
    
  }
}
     
