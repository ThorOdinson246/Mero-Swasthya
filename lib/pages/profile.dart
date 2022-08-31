import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:url_launcher/url_launcher.dart';
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
final CollectionReference user_details =
    FirebaseFirestore.instance.collection('user_details');
String? name;
String? address;
String? userid;
int? contact;

class _ProfileState extends State<Profile> {
  _fetch() async {
    await FirebaseFirestore.instance
        .collection('user_details')
        .doc(user!.uid)
        .get()
        .then((ds) {
      name = ds.data()!['name'];
      address = ds.data()!['address'];
      userid = ds.data()!['user-id'];
      contact = ds.data()!['phone'];
    }).catchError((e) {
      print(e);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _fetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    print(user!.email);
    final Stream<QuerySnapshot> dataStream = FirebaseFirestore.instance
        .collection('imp-link')
        .orderBy(
          'no',
          descending: false,
        )
        .snapshots();
    //HOME PAGE
    _fetch();
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
                          backgroundImage: NetworkImage(user!.photoURL!),
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
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Name: ',
                                  style: TextStyle(
                                    color: drkmd == true
                                        ? HexColor('#bebebe')
                                        : HexColor('#636e72'),
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: name,
                                  style: TextStyle(
                                    color: drkmd == true
                                        ? HexColor('#bebebe')
                                        : HexColor('#636e72'),
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Address: ',
                                  style: TextStyle(
                                    color: drkmd == true
                                        ? HexColor('#bebebe')
                                        : HexColor('#636e72'),
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: address,
                                  style: TextStyle(
                                    color: drkmd == true
                                        ? HexColor('#bebebe')
                                        : HexColor('#636e72'),
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'User-ID: ',
                                  style: TextStyle(
                                    color: drkmd == true
                                        ? HexColor('#bebebe')
                                        : HexColor('#636e72'),
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: userid,
                                  style: TextStyle(
                                    color: drkmd == true
                                        ? HexColor('#e63946')
                                        : HexColor('#e63946'),
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Contact: ',
                                  style: TextStyle(
                                    color: drkmd == true
                                        ? HexColor('#bebebe')
                                        : HexColor('#636e72'),
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: contact.toString(),
                                  style: TextStyle(
                                    color: drkmd == true
                                        ? HexColor('#bebebe')
                                        : HexColor('#636e72'),
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
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
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(12.0, 15, 12, 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'IMPORTANT LINKS',
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: List.generate(
                                    storedocs.length,
                                    (i) => Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 2, 0, 2),
                                      child: InkWell(
                                        onTap: () {
                                          launch(
                                              "https:${storedocs[i]['link']}");
                                        },
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    '${storedocs[i]['name']}:  ',
                                                style: TextStyle(
                                                  height: 0.9,
                                                  fontSize: 15,
                                                  fontFamily: 'Nunito',
                                                  fontWeight: FontWeight.w600,
                                                  color: drkmd == true
                                                      ? HexColor('#bebebe')
                                                      : Colors.grey[600],
                                                ),
                                              ),
                                              TextSpan(
                                                text: '${storedocs[i]['link']}',
                                                style: TextStyle(
                                                  height: 0.9,
                                                  fontSize: 15,
                                                  fontFamily: 'Nunito',
                                                  fontWeight: FontWeight.w300,
                                                  color: drkmd == true
                                                      ? HexColor('#bebebe')
                                                      : Colors.grey[600],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
