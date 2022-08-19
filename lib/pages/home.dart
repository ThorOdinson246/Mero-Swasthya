import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:testapp1/pages/explore.dart';
import 'package:testapp1/pages/quiz.dart';
import 'package:testapp1/pages/search_blood.dart';
import 'package:testapp1/pages/request_blood.dart';
import 'package:testapp1/pages_notes/lesson_astronomy.dart';
import 'package:testapp1/pages_notes/lesson_biology.dart';
import 'package:testapp1/pages_notes/lesson_chemistry.dart';
import 'package:testapp1/pages_notes/lesson_environment.dart';
import 'package:testapp1/pages_notes/lessons_physics.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'homepage.dart';
import 'settings.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> animation;
  late CurvedAnimation curve;
  TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: Duration(seconds: 0),
      vsync: this,
    );
    curve = CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.5,
        1.0,
        curve: Curves.fastOutSlowIn,
      ),
    );
    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(curve);

    Future.delayed(
      Duration(milliseconds: 200),
      () => _animationController.forward(),
    );
    geat();
    // autoLogIn();
  }

  String pastd = 'User';
  String grade = '10';
  String schname = 'Ekata Shishu Niketan';

  geat() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    String pastdata = sharedPrefs.getString('nm').toString();
    String grde = sharedPrefs.getString('grd').toString();
    String schnm = sharedPrefs.getString('sch').toString();
    int quizScore = sharedPrefs.getInt('quiz')!.toInt();
    // bool isDrkMdEnabled = sharedPrefs.getBool('isDarkModeEnabled') ?? false;

    setState(() {
      pastd = pastdata;
      grade = grde;
      schname = schnm;
      quizScore = quizScore;
      // drkmd = isDrkMdEnabled;
    });

    print('geting  record in 2nd page');
    print('pastdata' + pastd);
  }
  // autoLogIn() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final String userId = prefs.getString('username');

  //   if (userId != null) {
  //     setState(() {
  //       isLoggedIn = true;
  //       name = userId;
  //     });
  //     return userId;
  //   }
  // }

  // Future<Null> logout() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString('username', null);

  //   setState(() {
  //     name = '';
  //     isLoggedIn = false;
  //   });
  // }

  // getUserDetails() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final String userId = prefs.getString('username');
  //   final String firstname = prefs.getString('firstname');
  //   final String lastname = prefs.getString('lastname');
  //   final String school = prefs.getString('school');
  //   final String class = prefs.getString('class');
  //   final String favsubject = prefs.getString('favsubject');
  // }

  // Future<Null> setUserDetails() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString('firstname', nameControllerfirstname.text);
  //   prefs.setString('lastname', nameControllerlastname.text);
  //   prefs.setString('school', nameControllerschool.text);
  //   prefs.setString('class', nameControllerclass.text);
  //   prefs.setString('favsubject', nameControllerfavsubject.text);

  // }

  @override
  Widget build(BuildContext context) {
    final CollectionReference dailyquote =
      FirebaseFirestore.instance.collection('daily_quote');
    // String lesson;
    // double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    //HOME PAGE
    return Scaffold(
      backgroundColor: Colors.transparent,
      body:
          /*!isLoggedIn
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  !isLoggedIn
                      ? TextField(
                          textAlign: TextAlign.center,
                          controller: nameController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Please enter your name'),
                        )
                      : Text('You are logged in as $name'),
                  SizedBox(height: 10.0),
                  RaisedButton(
                    onPressed: () {
                      isLoggedIn ? null : loginUser();
                    },
                    child: isLoggedIn ? Text('Logout') : Text('Login'),
                  )
                ],
              ),
            )
          :*/
          SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 300,
                  width: width,
                  decoration: BoxDecoration(
                    color: HexColor('#0984e3'),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(15, 140, 15, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '"',
                          style: TextStyle(
                              height: 0.9,
                              fontSize: 35,
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                  offset: Offset(2, 2),
                                  blurRadius: 2,
                                )
                              ]),
                        ),

                        //EVERYTHING BETWEEN THESE

                        /*StreamBuilder(
                            stream: Firestore.instance
                                .collection('dailyquote')
                                .snapshots(),
                            // ignore: missing_return
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return */
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Spawn research and implement health programs to restructure, restore and redesign the public health system in Nepal.',
                                style: TextStyle(
                                  height: 0.9,
                                  fontSize: 20,
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    '- NHF',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'Nunito',
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ])

                        //UNcomment for android
                        /*   ; 
                              } else {
                                return ListView.builder(
                                    itemCount: snapshot.data.documents.length,
                                    itemBuilder: (context, index) {
                                      DocumentSnapshot quotes =
                                          snapshot.data.documents[index];
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${quotes['actual_quote']}',
                                            style: TextStyle(
                                              height: 0.9,
                                              fontSize: 23,
                                              fontFamily: 'Nunito',
                                              fontWeight: FontWeight.w900,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                '${quotes['said_by']}',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily: 'Nunito',
                                                  fontWeight: FontWeight.w900,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      );
                                    });
                              }
                            })

                            */
                        //uncomment for android

                        ///EVERYTHING BETWEEN THESE
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: -15,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                    child: Container(
                      height: 45,
                      width: width - 30,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 3,
                            blurRadius: 4,
                            color: Colors.grey,
                            offset: Offset(2, 5),
                          )
                        ],
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(12, 2, 0, 2),
                              child: Center(
                                child: Text(
                                  "What's New",
                                  style: TextStyle(
                                    color: HexColor('#0984e3'),
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w900,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 45,
                              child: FlatButton(
                                color: HexColor('#FFA400'),
                                padding: EdgeInsets.all(0),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ExplorePage()),
                                  );
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(30),
                                    topLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30),
                                    topRight: Radius.circular(30),
                                  ),
                                ),
                                child: Text(
                                  "EXPLORE",
                                  style: TextStyle(
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w900,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 75,
                  left: 15,
                  child: CircleAvatar(
                    radius: 28,
                    child: Text(
                      pastd.substring(0, 1).toUpperCase(),
                      style:
                          TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Positioned(
                  top: 81,
                  left: 80,
                  child: Text(
                    pastd.isEmpty == false
                        ? "Hello," + " " + pastd
                        : "Hello, User",
                    style: TextStyle(
                      color: HexColor('#ffffff'),
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Nunito',
                    ),
                  ),
                ),
                Positioned(
                    top: 101,
                    left: 80,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: grade.isEmpty == false
                                ? "Grade " + grade + "," + " "
                                : 'Grade 10, ',
                            style: TextStyle(
                              color: HexColor('#b2bec3'),
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Nunito',
                            ),
                          ),
                          TextSpan(
                            text: schname.isEmpty == false
                                ? schname
                                : 'Ekata Shishu Niketan',
                            style: TextStyle(
                              color: HexColor('#b2bec3'),
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Nunito',
                            ),
                          ),
                        ],
                      ),
                    )

                    /* Text(
                    "Grade-9,Ekata Shishu Niketan",
                    style: TextStyle(
                      color: HexColor('#b2bec3'),
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Nunito',
                    ),
                  ),*/
                    ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
              child: Text(
                "Areas",
                style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.3,
                    color: drkmd == true
                        ? HexColor('#bebebe')
                        : HexColor('#2d3436')),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    width: width,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: drkmd == true
                          ? HexColor('#444444')
                          : HexColor('#dfe6e9'),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 3,
                          color: drkmd == true
                              ? HexColor('#444444')
                              : HexColor('#dfe6e9'),
                          offset: Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(15, 15, 20, 5),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "NHF ",
                                  style: TextStyle(
                                    color: drkmd == true
                                        ? HexColor('#bebebe')
                                        : HexColor('#636e72'),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Image(
                                  image: AssetImage(
                                    "images/PHYSICS.png",
                                  ),
                                  height: 110,
                                  width: 120,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                FlatButton(
                                  color: HexColor('#0984e3'),
                                  textColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => lessonPhysics(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "Proceed",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900,
                                      fontFamily: 'Nunito',
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    width: width,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: drkmd == true
                          ? HexColor('#444444')
                          : HexColor('#dfe6e9'),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 3,
                          color: drkmd == true
                              ? HexColor('#444444')
                              : HexColor('#dfe6e9'),
                          offset: Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(15, 15, 20, 5),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "NCD WATCH NEPAL",
                                  style: TextStyle(
                                    color: drkmd == true
                                        ? HexColor('#bebebe')
                                        : HexColor('#636e72'),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Image(
                                  image: AssetImage(
                                    "images/chemistry.png",
                                  ),
                                  height: 110,
                                  width: 120,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                FlatButton(
                                  textColor: Colors.white,
                                  color: HexColor('#0984e3'),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => lessonChemistry(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "Proceed",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontFamily: 'Nunito',
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                  child: Container(
                    width: width,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: drkmd == true
                          ? HexColor('#444444')
                          : HexColor('#dfe6e9'),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 3,
                          color: drkmd == true
                              ? HexColor('#444444')
                              : HexColor('#dfe6e9'),
                          offset: Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(15, 15, 20, 5),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "BLOOD SEARCH",
                                  style: TextStyle(
                                    color: drkmd == true
                                        ? HexColor('#bebebe')
                                        : HexColor('#636e72'),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Image(
                                  image: AssetImage(
                                    "images/Biology.png",
                                  ),
                                  height: 110,
                                  width: 120,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                FlatButton(
                                  textColor: Colors.white,
                                  color: HexColor('#0984e3'),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SearchBlood(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "Proceed",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontFamily: 'Nunito',
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                  child: Container(
                    width: width,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: drkmd == true
                          ? HexColor('#444444')
                          : HexColor('#dfe6e9'),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 3,
                          color: drkmd == true
                              ? HexColor('#444444')
                              : HexColor('#dfe6e9'),
                          offset: Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(15, 15, 20, 5),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "REQUEST BLOOD",
                                  style: TextStyle(
                                    color: drkmd == true
                                        ? HexColor('#bebebe')
                                        : HexColor('#636e72'),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Image(
                                  image: AssetImage(
                                    "images/Astronomy.png",
                                  ),
                                  height: 110,
                                  width: 120,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                FlatButton(
                                  textColor: Colors.white,
                                  color: HexColor('#0984e3'),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => RequestBlood(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "Proceed",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontFamily: 'Nunito',
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 60),
                  child: Container(
                    width: width,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: drkmd == true
                          ? HexColor('#444444')
                          : HexColor('#dfe6e9'),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 3,
                          color: drkmd == true
                              ? HexColor('#444444')
                              : HexColor('#dfe6e9'),
                          offset: Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(15, 15, 20, 5),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "ENVIRONMENT",
                                  style: TextStyle(
                                    color: drkmd == true
                                        ? HexColor('#bebebe')
                                        : HexColor('#636e72'),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Image(
                                  image: AssetImage(
                                    "images/environment.png",
                                  ),
                                  height: 110,
                                  width: 120,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                FlatButton(
                                  textColor: Colors.white,
                                  color: HexColor('#0984e3'),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            lessonEnvironment(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "Proceed",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontFamily: 'Nunito',
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
