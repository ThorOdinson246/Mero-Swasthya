import 'package:cloud_firestore/cloud_firestore.dart';
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
  final CollectionReference get_news =
      FirebaseFirestore.instance.collection('news');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: drkmd == true ? Colors.grey[900] : Colors.grey[100],
      appBar: AppBar(
        toolbarHeight: 50,
        elevation: 0,
      ),
      body: StreamBuilder(
        stream: get_news.snapshots(),
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
                        width: MediaQuery.of(context).size.width,
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
                        child: GestureDetector(
                          onTap: () {
                            launch(
                              '${documentSnapshot['webpage']}',
                              // universalLinksOnly: true,
                              // forceWebView: true,
                              forceSafariVC: true,
                              enableJavaScript: true,
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              3,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                '${documentSnapshot['image']}',
                                              ),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(30),
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
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 0, 10, 0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text:
                                                          '${documentSnapshot['title']} ',
                                                      style: TextStyle(
                                                        color: drkmd == true
                                                            ? HexColor(
                                                                '#0984e3')
                                                            : HexColor(
                                                                '#0984e3'),
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
                                                          '${documentSnapshot['subtitle']}',
                                                      style: TextStyle(
                                                        color: drkmd == true
                                                            ? HexColor(
                                                                '#bebebe')
                                                            : HexColor(
                                                                '#636e72'),
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
                                                          '${documentSnapshot['webpage']}',
                                                      style: TextStyle(
                                                        color: drkmd == true
                                                            ? HexColor(
                                                                '#bebebe')
                                                            : HexColor(
                                                                '#636e72'),
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
                                                          'Uploaded ${documentSnapshot['date']}',
                                                      style: TextStyle(
                                                        color: drkmd == true
                                                            ? HexColor(
                                                                '#bebebe')
                                                            : HexColor(
                                                                '#636e72'),
                                                        fontSize: 12,
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
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
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
    );
  }

  //}
}
