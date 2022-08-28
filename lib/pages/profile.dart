import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:testapp1/widgets/loadingmanager.dart';

import 'googlesignin.dart';
import 'homepage.dart';
import 'settings.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

final FirebaseAuth authInstance = FirebaseAuth.instance;
final User? user = authInstance.currentUser;

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    print(user!.email);
    //HOME PAGE
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: width,
              decoration: BoxDecoration(
                color: HexColor('#e63946'),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 80, 0, 20),
                      child: CircleAvatar(
                        radius: 80,
                        backgroundColor: Colors.blue,
                        child: CircleAvatar(
                          radius: 75,
                          child: Text(
                            'R',
                            // _name.substring(0, 1).toUpperCase(),
                            style: TextStyle(
                                fontSize: 76, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      user!.displayName!,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: HexColor("#ffffff"),
                      ),
                    ),
                    // Text(
                    //   "Grade-10,Ekata Shishu Niketan",
                    //   style: TextStyle(
                    //     color: HexColor('#b2bec3'),
                    //     fontSize: 15,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                  ],
                ),
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
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Name : ',
                                  style: TextStyle(
                                    height: 0.9,
                                    fontSize: 20,
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w900,
                                    color: drkmd == true
                                        ? HexColor('#bebebe')
                                        : Colors.grey[600],
                                  ),
                                ),
                                TextSpan(
                                  text: '_name',
                                  style: TextStyle(
                                    height: 0.9,
                                    fontSize: 20,
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w700,
                                    color: drkmd == true
                                        ? HexColor('#bebebe')
                                        : Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Grade : ',
                                  style: TextStyle(
                                    height: 0.9,
                                    fontSize: 20,
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w900,
                                    color: drkmd == true
                                        ? HexColor('#bebebe')
                                        : Colors.grey[600],
                                  ),
                                ),
                                TextSpan(
                                  text: 'grade',
                                  style: TextStyle(
                                    height: 0.9,
                                    fontSize: 20,
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w700,
                                    color: drkmd == true
                                        ? HexColor('#bebebe')
                                        : Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'School : ',
                                  style: TextStyle(
                                    height: 0.9,
                                    fontSize: 20,
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w900,
                                    color: drkmd == true
                                        ? HexColor('#bebebe')
                                        : Colors.grey[600],
                                  ),
                                ),
                                TextSpan(
                                  text: 'school',
                                  style: TextStyle(
                                    height: 0.9,
                                    fontSize: 20,
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w700,
                                    color: drkmd == true
                                        ? HexColor('#bebebe')
                                        : Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Fav Topic : ',
                                  style: TextStyle(
                                    height: 0.9,
                                    fontSize: 20,
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w900,
                                    color: drkmd == true
                                        ? HexColor('#bebebe')
                                        : Colors.grey[600],
                                  ),
                                ),
                                TextSpan(
                                  text: 'favTopic',
                                  style: TextStyle(
                                    height: 0.9,
                                    fontSize: 20,
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w700,
                                    color: drkmd == true
                                        ? HexColor('#bebebe')
                                        : Colors.grey[600],
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
                    // height: 150,
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
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'YET TO DEVELOP',
                        style: TextStyle(
                          height: 0.9,
                          fontSize: 20,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w900,
                          color: drkmd == true
                              ? HexColor('#bebebe')
                              : Colors.grey[600],
                        ),
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
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'YET TO DEVELOP',
                        style: TextStyle(
                          height: 0.9,
                          fontSize: 20,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w900,
                          color: drkmd == true
                              ? HexColor('#bebebe')
                              : Colors.grey[600],
                        ),
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
