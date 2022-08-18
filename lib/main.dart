import 'package:firebase_core/firebase_core.dart';
import 'package:testapp1/pages/homepage.dart';
import 'package:testapp1/pages/request_blood.dart';
// import 'package:testapp1/pages/splash.dart';
import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Easy Science Notes',
      home: MyHomePage(),
    );
  }
}
