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

  clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    print('All Records Cleared');
  }

  darkMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkModeEnabled', drkmd);
    // drkmd = true;
  }
/*
  disableDarkMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkModeEnabled', false);
    drkmd = false;
  }

  checkDarkMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return bool
    bool drkmddm = prefs.getBool('isDarkModeEnabled');
    drkmd = drkmddm;
    return drkmddm;
  }*/

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
                        padding: EdgeInsets.fromLTRB(20, 10, 10, 4),
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
                              child: FlatButton(
                                textColor: Colors.white,
                                color: HexColor('#00b894'),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                onPressed: () {
                                  // clear();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => FAQs()));
                                },
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
                        padding: EdgeInsets.fromLTRB(20, 10, 10, 4),
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
                              child: FlatButton(
                                textColor: Colors.white,
                                color: HexColor('#00b894'),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                onPressed: () {
                                  clear();
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Splash()));
                                },
                                child: Text(
                                  "Log Out",
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
