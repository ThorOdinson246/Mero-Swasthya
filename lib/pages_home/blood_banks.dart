import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testapp1/pages/homepage.dart';
import 'package:testapp1/pages/quiz.dart';
import 'package:testapp1/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:testapp1/pages/quiz.dart';
import 'package:url_launcher/url_launcher.dart';

class bloodBanks extends StatefulWidget {
  @override
  bBloodBanksBtate createState() => bBloodBanksBtate();
}

class bBloodBanksBtate extends State<bloodBanks> {
  int score = 0;
  get() async {
    final SharedPreferences sharedPreffs =
        await SharedPreferences.getInstance();
    score = sharedPreffs.getInt('quiz')!;
    print('geting quiz record' + '$score');
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final CollectionReference blood_banks =
        FirebaseFirestore.instance.collection('blood_banks');
    return Scaffold(
      backgroundColor: drkmd == true ? Colors.grey[900] : Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff0984e3),
        centerTitle: true,
        toolbarHeight: 50,
        title: Text(
          "Blood Banks",
          style: TextStyle(
            fontFamily: 'SuezOne',
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: StreamBuilder(
        stream: blood_banks.orderBy('id', descending: false).snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                return Column(
                  children: [
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
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(5, 15, 10, 5),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundColor: HexColor('#e63946'),
                                  child: Icon(
                                    size: 40,
                                    Icons.bloodtype,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 7,
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      10.0, 10.0, 0, 5.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                              text:
                                                  '${documentSnapshot['name']}',
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
                                              text:
                                                  '${documentSnapshot['address']}',
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
                                              text:
                                                  '${documentSnapshot['phone']}',
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
                              Expanded(
                                flex: 2,
                                child: TextButton(
                                  onPressed: () {},
                                  child: TextButton(
                                    onPressed: () {
                                      launch(
                                          "tel://${documentSnapshot['phone']}");
                                    },
                                    // color: HexColor('#e63946'),
                                    style: TextButton.styleFrom(
                                      backgroundColor: HexColor('#e63946'),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.call,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    /*ListTile(
                      title: Text(
                        'Name: ${documentSnapshot['name']}',
                      ),
                      subtitle: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Phone: ${documentSnapshot['phone']}\n',
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text:
                                  'Address: ${documentSnapshot['address']}\n',
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text:
                                  'BloodType: ${documentSnapshot['bloodtype']}\n',
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () => _update(documentSnapshot)),
                            IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () =>
                                    _delete(documentSnapshot.id)),
                          ],
                        ),
                      ),
                    ),*/
                  ],
                );
              },
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
