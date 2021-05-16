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
    return FutureBuilder(
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
            theme: ThemeData.from(
              colorScheme: ColorScheme(
                brightness: Brightness.light,
                
                secondary: Colors.pink[50],
                primary: Colors.blueGrey[900],
                background: Colors.blueGrey[50],
                onSecondary: Colors.blueGrey[700],
                onPrimary: Colors.pink[50],
                surface: Colors.blueGrey[100],
                onSurface: Colors.blueGrey[700],
                onError: Colors.red,
                primaryVariant: Colors.blueGrey[700],
                onBackground: Colors.blueGrey[900],
                error: Colors.blueGrey[50],
                secondaryVariant: Colors.pink[500]
              ),
              textTheme: TextTheme(

              )
              // primaryColor: Colors.blueGrey[900], 
              // accentColor: Colors.pink[50],
              // scaffoldBackgroundColor: Colors.blueGrey[900],
              // brightness: Brightness.dark
              // floatingActionButtonTheme: FloatingActionButtonThemeData(
              //   backgroundColor: Colors.pink[50],
              //   splashColor: Colors.pink[100],
              // ),
              // iconTheme: IconThemeData(
              //   color: Colors.blueGrey[900],
              // ),
              // buttonTheme: ButtonThemeData(
              //   buttonColor: Colors.pink[50],
              //   //hoverColor: Colors.blueGrey[100],
              // ),
              // timePickerTheme: TimePickerThemeData(
              //   dialHandColor: Colors.pink[50],
              //   dialTextColor: Colors.blueGrey[900],
                
              // )
            ),
            home: StreamProvider<User>.value(
              initialData: null,
              value: AuthService().user,
              builder: (context, snapshot) {
                return Wrapper();
              }
            )
            
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return MaterialApp(
          home: Text('Loading')
        );
      },
    );
    
   
    
    
  }
}
     
