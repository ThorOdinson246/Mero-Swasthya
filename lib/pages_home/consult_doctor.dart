import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:internet_popup/internet_popup.dart';
import 'package:testapp1/pages/homepage.dart';
import 'package:testapp1/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class consultDoctors extends StatefulWidget {
  @override
  _consultDoctorsState createState() => _consultDoctorsState();
}

String pdfOfLesson = 'assests/sample2.pdf';

class _consultDoctorsState extends State<consultDoctors> {
  final CollectionReference find_doctors =
      FirebaseFirestore.instance.collection('find_doctors');
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      // extendBodyBehindAppBar: true,
      backgroundColor: drkmd == true ? Colors.grey[900] : Colors.grey[100],
      appBar: AppBar(
        // shadowColor: Colors.transparent,
        elevation: 0.0,
        // toolbarOpacity: 0,
        // shadowColor: Colors.transparent,
        // backgroundColor: Colors.transparent,
        backgroundColor: Color(0xff0984e3),
        centerTitle: true,
        toolbarHeight: 50,
        title: const Text(
          "Consult A Doctor",
          style: TextStyle(
            fontFamily: 'SuezOne',
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
            child: Text(
              "Consult top rated doctors all over nepal \nPlease note this feature is currently under development. The phone number below will not work as of this moment.",
              style: TextStyle(
                fontFamily: 'Nunito',
                color:
                    drkmd == true ? HexColor('#bebebe') : HexColor('#636e72'),
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Flexible(
            child: StreamBuilder(
              stream: find_doctors.snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                if (streamSnapshot.hasData) {
                  return ListView.builder(
                    itemCount: streamSnapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final DocumentSnapshot documentSnapshot =
                          streamSnapshot.data!.docs[index];
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Container(
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
                                padding: EdgeInsets.fromLTRB(5, 15, 10, 5),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          '${documentSnapshot['image']}'),
                                      radius: 40,
                                      backgroundColor: HexColor('#0984e3'),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10.0, 10.0, 0, 5.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        '${documentSnapshot['name']} ',
                                                    style: TextStyle(
                                                      color: drkmd == true
                                                          ? HexColor('#0984e3')
                                                          : HexColor('#0984e3'),
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        '${documentSnapshot['degree']}',
                                                    style: TextStyle(
                                                      color: drkmd == true
                                                          ? HexColor('#bebebe')
                                                          : HexColor('#636e72'),
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        '${documentSnapshot['specialty']}',
                                                    style: TextStyle(
                                                      color: drkmd == true
                                                          ? HexColor('#bebebe')
                                                          : HexColor('#636e72'),
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        '${documentSnapshot['phone']}',
                                                    style: TextStyle(
                                                      color: drkmd == true
                                                          ? HexColor('#bebebe')
                                                          : HexColor('#636e72'),
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        // mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          TextButton(
                                            onPressed: () {
                                              launch(
                                                  "sms://${documentSnapshot['phone']}");
                                            },
                                            // color: HexColor('#e63946'),
                                            style: TextButton.styleFrom(
                                              backgroundColor:
                                                  HexColor('#0984e3'),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                            ),
                                            child: const Icon(
                                              Icons.chat,
                                              color: Colors.white,
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
                      );
                    },
                  );
                }

                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }
}
