import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:internet_popup/internet_popup.dart';
import 'package:testapp1/pages/homepage.dart';
import 'package:testapp1/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class commonConcerns extends StatefulWidget {
  @override
  _commonConcernsState createState() => _commonConcernsState();
}

String pdfOfLesson = 'assests/sample2.pdf';

class _commonConcernsState extends State<commonConcerns> {
  final CollectionReference find_doctors =
      FirebaseFirestore.instance.collection('common_concerns');
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
          "Common Concerns",
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
              "Get quick and reliable information about some common health concerns",
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
                            padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                            child: Card(
                              color: drkmd == true
                                  ? HexColor('#444444')
                                  : HexColor('#dfe6e9'),
                              // boxShadow: [
                              //   BoxShadow(
                              //     spreadRadius: 3,
                              //     color: drkmd == true
                              //         ? HexColor('#444444')
                              //         : HexColor('#dfe6e9'),
                              //     offset: const Offset(0, 6),
                              //   ),
                              // ]
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              elevation: 0,
                              child: ExpansionTile(
                                title: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '${documentSnapshot['name']} ',
                                        style: TextStyle(
                                            color: drkmd == true
                                                ? HexColor('#0984e3')
                                                : HexColor('#0984e3'),
                                            fontSize: 17,
                                            fontWeight: FontWeight.w900,
                                            fontFamily: 'Nunito'),
                                      ),
                                    ],
                                  ),
                                ),
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(5, 5, 10, 5),
                                    child: Column(
                                      children: [
                                        Center(
                                          child: CircleAvatar(
                                            backgroundImage: NetworkImage(
                                                '${documentSnapshot['image']}'),
                                            radius: 60,
                                            backgroundColor:
                                                HexColor('#0984e3'),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10.0, 10.0, 0, 5.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              // RichText(
                                              //   text: TextSpan(
                                              //     children: [
                                              //       TextSpan(
                                              //         text:
                                              //             '${documentSnapshot['name']} ',
                                              //         style: TextStyle(
                                              //             color: drkmd == true
                                              //                 ? HexColor(
                                              //                     '#0984e3')
                                              //                 : HexColor(
                                              //                     '#0984e3'),
                                              //             fontSize: 17,
                                              //             fontWeight:
                                              //                 FontWeight.w900,
                                              //             fontFamily: 'Nunito'),
                                              //       ),
                                              //     ],
                                              //   ),
                                              // ),
                                              // RichText(
                                              //   text: TextSpan(
                                              //     children: [
                                              //       TextSpan(
                                              //         text:
                                              //             '${documentSnapshot['morelink']}',
                                              //         style: TextStyle(
                                              //           color: drkmd == true
                                              //               ? HexColor(
                                              //                   '#bebebe')
                                              //               : HexColor(
                                              //                   '#636e72'),
                                              //           fontSize: 14,
                                              //           fontWeight:
                                              //               FontWeight.w300,
                                              //         ),
                                              //       ),
                                              //     ],
                                              //   ),
                                              // ),
                                              // RichText(
                                              //   text: TextSpan(
                                              //     children: [
                                              //       TextSpan(
                                              //         text:
                                              //             '${documentSnapshot['morelink']}',
                                              //         style: TextStyle(
                                              //           color: drkmd == true
                                              //               ? HexColor(
                                              //                   '#bebebe')
                                              //               : HexColor(
                                              //                   '#636e72'),
                                              //           fontSize: 14,
                                              //           fontWeight:
                                              //               FontWeight.w400,
                                              //         ),
                                              //       ),
                                              //     ],
                                              //   ),
                                              // ),
                                              RichText(
                                                // overflow: TextOverflow.ellipsis,
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text:
                                                          '${documentSnapshot['details']}',
                                                      style: TextStyle(
                                                        color: drkmd == true
                                                            ? HexColor(
                                                                '#bebebe')
                                                            : HexColor(
                                                                '#636e72'),
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w200,
                                                        fontFamily: 'Nunito',
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: 'Symptoms',
                                                      style: TextStyle(
                                                          color: drkmd == true
                                                              ? HexColor(
                                                                  '#0984e3')
                                                              : HexColor(
                                                                  '#0984e3'),
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w900,
                                                          fontFamily: 'Nunito'),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text:
                                                          '${documentSnapshot['symptoms']}\n',
                                                      style: TextStyle(
                                                          color: drkmd == true
                                                              ? HexColor(
                                                                  '#bebebe')
                                                              : HexColor(
                                                                  '#636e72'),
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontFamily: 'Nunito'),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: 'Prevention',
                                                      style: TextStyle(
                                                          color: drkmd == true
                                                              ? HexColor(
                                                                  '#0984e3')
                                                              : HexColor(
                                                                  '#0984e3'),
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w900,
                                                          fontFamily: 'Nunito'),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text:
                                                          '${documentSnapshot['prevention']} ',
                                                      style: TextStyle(
                                                          color: drkmd == true
                                                              ? HexColor(
                                                                  '#bebebe')
                                                              : HexColor(
                                                                  '#636e72'),
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontFamily: 'Nunito'),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              TextButton(
                                                style: TextButton.styleFrom(
                                                  backgroundColor:
                                                      HexColor('#0984e3'),
                                                  shape: const RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.only(
                                                          bottomLeft:
                                                              const Radius
                                                                  .circular(40),
                                                          topLeft:
                                                              Radius.circular(
                                                                  40),
                                                          bottomRight:
                                                              const Radius
                                                                  .circular(40),
                                                          topRight:
                                                              Radius.circular(
                                                                  40))),
                                                ),
                                                onPressed: () {
                                                  launch(
                                                      '${documentSnapshot['morelink']}',
                                                      enableDomStorage: true);
                                                },
                                                child: const Text(
                                                  "More ...",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w900,
                                                    fontFamily: 'Nunito',
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
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
