import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:testapp1/pages/common_concerns.dart';
import 'package:testapp1/pages/explore.dart';
import 'package:testapp1/pages/health_tools.dart';
import 'package:testapp1/pages/anxiety_quiz.dart';
import 'package:testapp1/pages/search_blood.dart';
import 'package:testapp1/pages/request_blood.dart';
import 'package:testapp1/pages_home/lesson_chemistry.dart';
import 'package:testapp1/pages_home/blood_banks.dart';
import 'package:testapp1/pages_home/consult_doctor.dart';
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
      duration: const Duration(seconds: 0),
      vsync: this,
    );
    curve = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
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
      const Duration(milliseconds: 200),
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
    final Stream<QuerySnapshot> homepagead =
        FirebaseFirestore.instance.collection('homepagead').snapshots();
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
                              return const CircularProgressIndicator();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
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
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(12, 2, 0, 2),
                            child: Center(
                              child: Text(
                                "New in Health ",
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
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: HexColor('#FFA400'),
                                foregroundColor: Colors.black,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: const Radius.circular(40),
                                    topLeft: Radius.circular(40),
                                    bottomRight: const Radius.circular(40),
                                    topRight: Radius.circular(40),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ExplorePage()),
                                );
                              },
                              child: const Text(
                                "EXPLORE",
                                style: const TextStyle(
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.w900,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 15, 15, 5),
                child: Column(
                  children: [
                    StreamBuilder<QuerySnapshot>(
                      stream: homepagead,
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasData) {
                          final List storedocs = [];
                          snapshot.data!.docs.map(
                            (DocumentSnapshot document) {
                              Map a = document.data() as Map<String, dynamic>;
                              storedocs.add(a);
                              a['id'] = document.id;
                            },
                          ).toList();
                          return Column(
                            children: List.generate(
                              storedocs.length,
                              (i) => Container(
                                width: width,
                                height: 100,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        '${storedocs[i]['adlink']}'),
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                  color: drkmd == true
                                      ? HexColor('#444444')
                                      : HexColor('#dfe6e9'),
                                ),
                              ),
                            ),
                          );
                        }
                        return const CircularProgressIndicator();
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Text(
                  "Services",
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
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                    child: Container(
                      width: width,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: drkmd == true
                            ? HexColor('#444444')
                            : HexColor('#dfe6e9'),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 3,
                            color: drkmd == true
                                ? HexColor('#444444')
                                : HexColor('#dfe6e9'),
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 15, 20, 5),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
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
                                  const Image(
                                    image: AssetImage(
                                      "images/blood-bank.png",
                                    ),
                                    height: 110,
                                    width: 120,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: HexColor('#0984e3'),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: const Radius.circular(40),
                                          topLeft: Radius.circular(40),
                                          bottomRight:
                                              const Radius.circular(40),
                                          topRight: Radius.circular(40),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => bloodBanks(),
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      "Proceed",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                        fontFamily: 'Nunito',
                                        fontSize: 17,
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
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 15, 20, 5),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
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
                                  const Image(
                                    image: const AssetImage(
                                      "images/request.png",
                                    ),
                                    height: 110,
                                    width: 120,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: HexColor('#0984e3'),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: const Radius.circular(40),
                                          topLeft: Radius.circular(40),
                                          bottomRight:
                                              const Radius.circular(40),
                                          topRight: Radius.circular(40),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const RequestBlood(),
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      "Proceed",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                        fontFamily: 'Nunito',
                                        fontSize: 17,
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
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 15, 20, 5),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "HEALTH UTILITIES",
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
                                      "images/scalpel.png",
                                    ),
                                    height: 110,
                                    width: 120,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: HexColor('#0984e3'),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: const Radius.circular(40),
                                          topLeft: Radius.circular(40),
                                          bottomRight:
                                              const Radius.circular(40),
                                          topRight: Radius.circular(40),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => HealthTools(),
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      "Proceed",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                        fontFamily: 'Nunito',
                                        fontSize: 17,
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
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 15, 20, 5),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "COMMON CONCERNS",
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
                                      "images/scalpel.png",
                                    ),
                                    height: 110,
                                    width: 120,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: HexColor('#0984e3'),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: const Radius.circular(40),
                                          topLeft: Radius.circular(40),
                                          bottomRight:
                                              const Radius.circular(40),
                                          topRight: Radius.circular(40),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              commonConcerns(),
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      "Proceed",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                        fontFamily: 'Nunito',
                                        fontSize: 17,
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
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 15, 20, 5),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "FIND A BLOOD DONOR",
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
                                      "images/donor.png",
                                    ),
                                    height: 110,
                                    width: 120,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: HexColor('#0984e3'),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: const Radius.circular(40),
                                          topLeft: Radius.circular(40),
                                          bottomRight:
                                              const Radius.circular(40),
                                          topRight: Radius.circular(40),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const SearchBlood(),
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      "Proceed",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                        fontFamily: 'Nunito',
                                        fontSize: 17,
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
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 15, 20, 5),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "CONSULT A DOCTOR",
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
                                      "images/doctor.png",
                                    ),
                                    height: 110,
                                    width: 120,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: HexColor('#0984e3'),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: const Radius.circular(40),
                                          topLeft: Radius.circular(40),
                                          bottomRight:
                                              const Radius.circular(40),
                                          topRight: Radius.circular(40),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              consultDoctors(),
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      "Proceed",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
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
                ],
              ),
            ],
          ),
        ));
  }
}
