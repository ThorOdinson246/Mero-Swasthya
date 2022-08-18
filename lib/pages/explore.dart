import 'package:testapp1/pages/settings.dart';
import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'homepage.dart';
import 'package:url_launcher/url_launcher.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: drkmd == true ? Colors.grey[900] : Colors.grey[100],
        appBar: AppBar(
          toolbarHeight: 50,
          elevation: 0,
        ));
  }

  //}
}
