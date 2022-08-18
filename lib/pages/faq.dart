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
            ExpansionTile(
              // initiallyExpanded: true,
              title: Text(
                'Who was this app developed by?',
                style: TextStyle(
                  color: drkmd == true ? HexColor('#bebebe') : Colors.grey[800],
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
                        text: 'This app was made by ',
                        style: TextStyle(
                          color: drkmd == true
                              ? HexColor('#bebebe')
                              : Colors.grey[800],
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: 'Mukesh Poudel. ',
                        style: TextStyle(
                          color: drkmd == true
                              ? HexColor('#bebebe')
                              : Colors.grey[800],
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w900,
                        ),
                      )
                    ]),
                  ),
                ),
              ],
            ),
            ExpansionTile(
              // initiallyExpanded: true,
              title: Text(
                'What is the EXPLORE button in the homepage?',
                style: TextStyle(
                  color: drkmd == true ? HexColor('#bebebe') : Colors.grey[800],
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w800,
                ),
              ),
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              expandedAlignment: Alignment.topLeft,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 2, 0, 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Well you can receive interesting content You can get knowledge,articles and videos about interesting events happening in the world. Make sure you check it daily for new and exciting stuffs.',
                        style: TextStyle(
                          color: drkmd == true
                              ? HexColor('#bebebe')
                              : Colors.grey[800],
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text(
                'I found a bug in the app. Who may I report to?',
                style: TextStyle(
                  color: drkmd == true ? HexColor('#bebebe') : Colors.grey[800],
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w800,
                ),
              ),
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              expandedAlignment: Alignment.topLeft,
              childrenPadding: EdgeInsets.zero,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 2, 0, 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'You may report the bug along with screenshot to abhishekpoudel246@gmail.com',
                        style: TextStyle(
                          color: drkmd == true
                              ? HexColor('#bebebe')
                              : Colors.grey[800],
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text(
                'I want to play quiz in the app. How can I play?',
                style: TextStyle(
                  color: drkmd == true ? HexColor('#bebebe') : Colors.grey[800],
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w800,
                ),
              ),
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              expandedAlignment: Alignment.topLeft,
              childrenPadding: EdgeInsets.zero,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 2, 0, 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'You may click on the yellow button on the homescreen to play a Quiz game in the app.',
                        style: TextStyle(
                          color: drkmd == true
                              ? HexColor('#bebebe')
                              : Colors.grey[800],
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text(
                'I want new questions in the quiz. How may I achieve so?',
                style: TextStyle(
                  color: drkmd == true ? HexColor('#bebebe') : Colors.grey[800],
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w800,
                ),
              ),
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              expandedAlignment: Alignment.topLeft,
              childrenPadding: EdgeInsets.zero,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 2, 0, 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'You can always check the app on the store for a newer version. This also gives you access to new quizes,features,notes and games.',
                        style: TextStyle(
                          color: drkmd == true
                              ? HexColor('#bebebe')
                              : Colors.grey[800],
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text(
                'I am experiencing some problems in the app. How may I fix it?',
                style: TextStyle(
                  color: drkmd == true ? HexColor('#bebebe') : Colors.grey[800],
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w800,
                ),
              ),
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              expandedAlignment: Alignment.topLeft,
              childrenPadding: EdgeInsets.zero,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 2, 0, 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'You can always check the app on the store for a newer version to fix it. This also gives you access to new features,notes and games.',
                        style: TextStyle(
                          color: drkmd == true
                              ? HexColor('#bebebe')
                              : Colors.grey[800],
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text(
                'I am not getting new notices on the Explore page. How may I fix it?',
                style: TextStyle(
                  color: drkmd == true ? HexColor('#bebebe') : Colors.grey[800],
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w800,
                ),
              ),
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              expandedAlignment: Alignment.topLeft,
              childrenPadding: EdgeInsets.zero,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 2, 0, 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'You can always check the app on the store for a newer version to fix it. This also gives you access to new features,notes and games and improvements of the currently existing problems.',
                        style: TextStyle(
                          color: drkmd == true
                              ? HexColor('#bebebe')
                              : Colors.grey[800],
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text(
                'I want to give some suggestion regarding app. How may I?',
                style: TextStyle(
                  color: drkmd == true ? HexColor('#bebebe') : Colors.grey[800],
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w800,
                ),
              ),
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              expandedAlignment: Alignment.topLeft,
              childrenPadding: EdgeInsets.zero,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 2, 0, 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'You can mail us freely at abhishekpoudel246@gmail.com',
                        style: TextStyle(
                          color: drkmd == true
                              ? HexColor('#bebebe')
                              : Colors.grey[800],
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
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
