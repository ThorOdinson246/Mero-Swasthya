import 'package:flutter/material.dart';
// import 'package:social_media_buttons/social_media_button.dart';
// import 'package:social_media_buttons/social_media_buttons.dart';
// import 'package:social_media_buttons/social_media_icons.dart';
import 'homepage.dart';
import 'settings.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  bool credvisible = true;

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

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
                color: HexColor('#6c5ce7'),
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
                        backgroundColor: Colors.blue,
                        // maxRadius: 90,
                        radius: 80,
                        child: Text(
                          "ESN",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    Text(
                      "Blood Bank Nepal",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: HexColor("#ffffff"),
                      ),
                    ),

                    //TODO: Use RichText and use Url Launcher
                    // Text(
                    //   "Notes By Bipin Shrestha ",
                    //   style: TextStyle(
                    //     color: HexColor('#55efc4'),
                    //     fontSize: 15,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                    // Text(
                    //   " ",
                    //   style: TextStyle(
                    //     color: HexColor('#55efc4'),
                    //     fontSize: 13,
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
                    child: Column(
                      children: [
                        Column(
                          children: [
                            // Expanded(
                            //   flex: 3,
                            // child:
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 8),
                                    child: CircleAvatar(
                                      // backgroundColor: Colors.yellow,
                                      radius: 40,
                                      backgroundImage: AssetImage(
                                        'images/bipinsir.png',
                                      ),
                                    ),
                                  ),
                                  Text(
                                    "Mukesh Poudel ",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Nunito',
                                      fontWeight: FontWeight.w700,
                                      color: drkmd == true
                                          ? HexColor('#bebebe')
                                          : Colors.grey[800],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // ),
                            // Expanded(
                            //   flex: 1,
                            // child:
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                      text: 'Hello, I am ',
                                      style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                        color: drkmd == true
                                            ? HexColor('#bebebe')
                                            : Colors.grey[800],
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Mukesh Poudel',
                                      style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontSize: 13,
                                        fontWeight: FontWeight.w900,
                                        color: drkmd == true
                                            ? HexColor('#bebebe')
                                            : Colors.grey[800],
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          '. I am a student and MSc holder in Computer Science specializing in Artificial Intelligence. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.\n Check out my youtube channel:\n Reach me out here:.',
                                      style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                        color: drkmd == true
                                            ? HexColor('#bebebe')
                                            : Colors.grey[800],
                                      ),
                                    ),
                                  ]),
                                )),
                            // )
                          ],
                        ),
                        Row(children: []),
                      ],
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
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: InkWell(
                        onTap: () {},
                        child: Text(
                          'You can also access the web version of this app from https://nhf.org',
                          style: TextStyle(
                            color: drkmd == true
                                ? HexColor('#bebebe')
                                : Colors.grey[800],
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                //My and other intro starts here

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
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Text(
                              'A word from Developer',
                              style: TextStyle(
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w800,
                                color: drkmd == true
                                    ? HexColor('#bebebe')
                                    : Colors.grey[800],
                              ),
                            ),
                          ),
                          Visibility(
                            visible: credvisible,
                            child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                  text: 'Hello Students, I am',
                                  style: TextStyle(
                                    color: drkmd == true
                                        ? HexColor('#bebebe')
                                        : Colors.grey[800],
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                TextSpan(
                                  text: ' Abhishek Poudel. ',
                                  style: TextStyle(
                                    color: drkmd == true
                                        ? HexColor('#bebebe')
                                        : Colors.grey[800],
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      'Lorem ipsum wahdkahdiaa afuaih afoa hao agiudgf iagugfd fg sfis fu fi',
                                  style: TextStyle(
                                    color: drkmd == true
                                        ? HexColor('#bebebe')
                                        : Colors.grey[800],
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                TextSpan(
                                  text: ' ANy thing important ',
                                  style: TextStyle(
                                    color: drkmd == true
                                        ? HexColor('#bebebe')
                                        : Colors.grey[800],
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      ' while the notes and amazing contents of the app are provided by our respected ',
                                  style: TextStyle(
                                    color: drkmd == true
                                        ? HexColor('#bebebe')
                                        : Colors.grey[800],
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                TextSpan(
                                  text: 'any thing imopie ',
                                  style: TextStyle(
                                    color: drkmd == true
                                        ? HexColor('#bebebe')
                                        : Colors.grey[800],
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      'sir. This app was created with the intention to help  Feel free to suggest us for any improvements.',
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
                  ),
                ),

                //MY and others Intro ends here
              ],
            ),
          ],
        ),
      ),
    );
  }
}
