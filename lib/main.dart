// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/screens/google_home.dart';
// import 'package:movie_app/screens/homepage.dart';
// import 'package:movie_app/screens/login.dart';
// import 'package:movie_app/screens/homepage.dart';
// import 'package:movie_app/screens/moviedetail.dart';
// import 'package:movie_app/screens/signup.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:movie_app/screens/mainHome.dart';
// import 'package:http/http.dart' as http;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xff16161d),
          // primarySwatch: Colors.black45,
          // 282c35   363030   232020
          fontFamily: 'Sharp Grotesk DB Cyr Medium 22'),
          home: GooglePage(),
      // home: StreamBuilder(
      //     stream: FirebaseAuth.instance.authStateChanges(),
      //     builder: (ctx, snapShot) {
      //       if (snapShot.hasData) {
      //         return MainHome();
      //       } else {
      //         return Login();
      //       }
      //     }),
    );
  }
}
