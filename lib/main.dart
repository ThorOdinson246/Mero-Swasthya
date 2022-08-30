import 'package:firebase_core/firebase_core.dart';
import 'package:testapp1/pages/homepage.dart';
// import 'package:testapp1/pages/search_blood.dart';
// import 'package:testapp1/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:testapp1/pages/medicine_reminder.dart';
import 'package:testapp1/pages/register_page.dart';
import 'package:testapp1/pages/splash.dart';
// import 'package:flutter_no_internet_widget/flutter_no_internet_widget.dart';
// import 'package:internet_popup/internet_popup.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blood Donation App',
      home: Splash(),
    );
  }
}
