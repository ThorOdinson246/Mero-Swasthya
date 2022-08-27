import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:testapp1/pages/settings.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';

class FAQs extends StatefulWidget {
  @override
  _FAQsState createState() => _FAQsState();
}

class _FAQsState extends State<FAQs> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final Stream<QuerySnapshot> dataStream = FirebaseFirestore.instance
        .collection('faqs')
        .orderBy(
          'no',
          descending: false,
        )
        .snapshots();
    return Scaffold(
      backgroundColor: drkmd == true ? Colors.grey[900] : Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'FAQs',
          style: TextStyle(
            fontFamily: 'SuezOne',
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        toolbarHeight: 50,
        backgroundColor: HexColor('#00b894'),
      ),
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
                    "images/question.png",
                  ),
                ),
              ),
            ),
            //FAQS HERE
            StreamBuilder<QuerySnapshot>(
              stream: dataStream,
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
                      (i) => ExpansionTile(
                        // initiallyExpanded: true,
                        title: Text(
                          storedocs[i]['question'],
                          style: TextStyle(
                            color: drkmd == true
                                ? HexColor('#bebebe')
                                : Colors.grey[800],
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        expandedCrossAxisAlignment: CrossAxisAlignment.start,
                        expandedAlignment: Alignment.topLeft,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 2, 0, 0),
                            child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                  text: storedocs[i]['answer'],
                                  style: TextStyle(
                                    color: drkmd == true
                                        ? HexColor('#bebebe')
                                        : Colors.grey[800],
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ]),
                            ),
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
    );
  }
}
