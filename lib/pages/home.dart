import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:testapp1/pages/explore.dart';
import 'package:testapp1/pages/quiz.dart';
import 'package:testapp1/pages/search_blood.dart';
import 'package:testapp1/pages/request_blood.dart';
import 'package:testapp1/pages_home/lesson_chemistry.dart';
import 'package:testapp1/pages_home/blood_banks.dart';
import 'package:testapp1/pages_home/find_doctor.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'homepage.dart';
import 'settings.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
  // final String id;
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
  }

  String pastd = 'User';
  String grade = '10';
  String schname = 'Ekata Shishu Niketan';

  geat() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    String pastdata = sharedPrefs.getString('nm').toString();
    String grde = sharedPrefs.getString('grd').toString();
    String schnm = sharedPrefs.getString('sch').toString();
    // int quizScore = sharedPrefs.getInt('quiz')!.toInt();

    setState(() {
      pastd = pastdata;
      grade = grde;
      schname = schnm;
      // quizScore = quizScore;
    });

    print('geting  record in 2nd page');
    print('pastdata' + pastd);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final Stream<QuerySnapshot> dataStream =
        FirebaseFirestore.instance.collection('daily_quote').snapshots();
    //HOME PAGE
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    // height: 300,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: HexColor('#0984e3'),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 80, 15, 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          StreamBuilder<QuerySnapshot>(
                            stream: dataStream,
                            builder: (BuildContext context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              /*
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Text(
                                  'The greatest glory in living lies not in never falling, but in rising every time we fall got it right i am check. ',
                                  style: TextStyle(
                                    height: 0.9,
                                    fontSize: 30,
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                    shadows: [
                                      Shadow(
                                        offset: Offset(2, 2),
                                        blurRadius: 2,
                                      ),
                                    ],
                                  ),
                                );
                              }*/
                              if (snapshot.hasData) {
                                final List storedocs = [];
                                snapshot.data!.docs.map(
                                  (DocumentSnapshot document) {
                                    Map a =
                                        document.data() as Map<String, dynamic>;
                                    storedocs.add(a);
                                    a['id'] = document.id;
                                  },
                                ).toList();
                                return Column(
                                  children: List.generate(
                                    storedocs.length,
                                    (i) => Column(
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              storedocs[i]['quote'],
                                              style: const TextStyle(
                                                height: 0.9,
                                                fontSize: 30,
                                                fontFamily: 'Nunito',
                                                fontWeight: FontWeight.w900,
                                                color: Colors.white,
                                                shadows: [
                                                  Shadow(
                                                    offset: Offset(2, 2),
                                                    blurRadius: 2,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  storedocs[i]['by'],
                                                  style: const TextStyle(
                                                    height: 0.9,
                                                    fontSize: 13,
                                                    fontFamily: 'Nunito',
                                                    fontWeight: FontWeight.w900,
                                                    color: Colors.white,
                                                    shadows: [
                                                      Shadow(
                                                        offset: Offset(2, 2),
                                                        blurRadius: 2,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                              return CircularProgressIndicator();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 45,
                    width: width - 30,
                    decoration: BoxDecoration(
                      boxShadow: const [
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
                  /*
                  Positioned(
                    top: 75,
                    left: 15,
                    child: CircleAvatar(
                      radius: 28,
                      child: Text(
                        pastd.substring(0, 1).toUpperCase(),
                        style: TextStyle(
                            fontSize: 36, fontWeight: FontWeight.bold),
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
                */
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 5, 15, 0),
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
                                    "FIND A DOCTOR",
                                    style: TextStyle(
                                      fontFamily: 'Nunito',
                                      color: drkmd == true
                                          ? HexColor('#bebebe')
                                          : HexColor('#636e72'),
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Image(
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
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => findDoctors(),
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
                                    "ANXIETY CHECK",
                                    style: TextStyle(
                                      fontFamily: 'Nunito',
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
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => QuizPage(),
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
                                    "FIND A DONOR",
                                    style: TextStyle(
                                      fontFamily: 'Nunito',
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
                                        borderRadius:
                                            BorderRadius.circular(20)),
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
                                      fontFamily: 'Nunito',
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
                                        borderRadius:
                                            BorderRadius.circular(20)),
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
                                    "BLOOD BANKS",
                                    style: TextStyle(
                                      fontFamily: 'Nunito',
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
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => bloodBanks(),
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
        ));
  }
}
