import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:phoenix_native/phoenix_native.dart';
import 'package:testapp1/main.dart';
import 'package:testapp1/pages/log_out.dart';
import 'package:testapp1/pages/register_page.dart';
import 'package:testapp1/pages/splash.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'faq.dart';
import 'homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

bool drkmd = false;

class _SettingsState extends State<Settings> {
  // bool drkmd = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // restore();
    // checkDarkMode();
  }

  signOut() {
    final googleSignIn = GoogleSignIn();
    googleSignIn.disconnect();
    // print('signed out');
  }

  clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();

    sharedPrefs.setBool('isLogged', false);
    log('All Records Cleared');
    // Navigator.of(context).pushReplacement(
    //   MaterialPageRoute(
    //     builder: (context) => Splash(),
    //   ),
    // );
  }

  darkMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkModeEnabled', drkmd);
    // drkmd = true;
  }

  final FirebaseAuth authInstance = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    //HOME PAGE
    return Scaffold(
      backgroundColor: drkmd == true ? Colors.grey[900] : Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: width,
              decoration: BoxDecoration(
                color: HexColor('#00b894'),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image(
                  image: AssetImage(
                    "images/settings.png",
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                  child: Container(
                    width: width,
                    height: 40,
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
                      padding: EdgeInsets.fromLTRB(20, 10, 10, 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              "Dark Mode",
                              style: TextStyle(
                                fontFamily: 'Nunito',
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: drkmd == true
                                    ? HexColor('#bebebe')
                                    : Colors.grey[800],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Switch(
                                  value: drkmd,
                                  onChanged: (value) {
                                    setState(() {
                                      drkmd = value;
                                      darkMode();

                                      // enableDarkMode();
                                      // if (drkmd == true) {
                                      //   enableDarkMode();
                                      // } else
                                      //   () {
                                      //     disableDarkMode();
                                      //   };
                                      // if (checkDarkMode() == false) {
                                      //   drkmd = value;
                                      //   enableDarkMode();
                                      // } else
                                      //   () {
                                      //     drkmd = value;
                                      //     disableDarkMode();
                                      //   };
                                      print(drkmd);
                                      // Scaffold.of(context)
                                      //     .showSnackBar(SnackBar(
                                      //   content: Text(
                                      //       'Move to next page to see effect.'),
                                      // ));
                                    });
                                  },
                                  activeTrackColor: HexColor('#00b894'),
                                  activeColor: HexColor('#00b894'),
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
                      // margin: EdgeInsets.all(0),
                      width: width,
                      height: 40,
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
                          ]),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 10, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                "FAQs",
                                style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: drkmd == true
                                      ? HexColor('#bebebe')
                                      : Colors.grey[800],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: TextButton(
                                onPressed: () {
                                  // clear();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => FAQs()));
                                },
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: HexColor('#00b894'),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: Text(
                                  "See",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontFamily: 'Nunito',
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 60),
                    child: Container(
                      width: width,
                      height: 40,
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
                          ]),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 10, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                "Log Out",
                                style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: drkmd == true
                                      ? HexColor('#bebebe')
                                      : Colors.grey[800],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: TextButton(
                                child: Text(
                                  "Log Out",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontFamily: 'Nunito',
                                    fontSize: 18,
                                  ),
                                ),
                                onPressed: () {
                                  // signOut();
                                  // clear();
                                  // Navigator.pop(context);
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) => LogOut(),
                                    ),
                                  );
                                  // PhoenixNative.restartApp();
                                },
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: HexColor('#00b894'),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
