import 'package:flutter/material.dart';
// import 'package:social_media_buttons/social_media_button.dart';
// import 'package:social_media_buttons/social_media_buttons.dart';
// import 'package:social_media_buttons/social_media_icons.dart';
import 'homepage.dart';
import 'settings.dart';
// import 'package:url_launcher/url_launcher.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  // bool credvisible = true;

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
                      child: Image.asset(
                        'images/logo.png',
                        fit: BoxFit.contain,
                        height: 200,
                        width: width,
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
                                children: [],
                              ),
                            ),
                            // ),
                            // Expanded(
                            //   flex: 1,
                            // child:
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '',
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
                                      text: 'Mero Swasthya',
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
                                          ' is a all-in-one solution to all your health problems. Through this app you can receive new health and lifestyle tips. You can access various emergency services as Blood Bank, free Doctor\'s consultation*, measure Heart Rate*, BMI Calculator, IBW Calculator, Self Anxiety Check and many more. MOre features are to be added soon.',
                                      style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                        color: drkmd == true
                                            ? HexColor('#bebebe')
                                            : Colors.grey[800],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // )
                          ],
                        ),
                        Row(children: []),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 70),
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
                              'Navigation Help',
                              style: TextStyle(
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w800,
                                color: drkmd == true
                                    ? HexColor('#bebebe')
                                    : Colors.grey[800],
                              ),
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '',
                                  style: TextStyle(
                                    color: drkmd == true
                                        ? HexColor('#bebebe')
                                        : Colors.grey[800],
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Blood Banks',
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
                                      '\nAccess the bloodbanks located near you and contact them quickly with just click of a button.\n',
                                  style: TextStyle(
                                    color: drkmd == true
                                        ? HexColor('#bebebe')
                                        : Colors.grey[800],
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Request Blood',
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
                                      '\nPlace a personal request for blood for other users using the app to see and contact you.',
                                  style: TextStyle(
                                    color: drkmd == true
                                        ? HexColor('#bebebe')
                                        : Colors.grey[800],
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                TextSpan(
                                  text: '\nHealth Utilities',
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
                                      '\n A single pathway to various most useful health tools you need. Access Body Mass INdex, Ideal Body Weight Calculators or take a Self Anxiety Test to assess yourself. Heart Beat Measure and Medicine Reminder are currently in development. ',
                                  style: TextStyle(
                                    color: drkmd == true
                                        ? HexColor('#bebebe')
                                        : Colors.grey[800],
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                TextSpan(
                                  text: '\nFind A Blood Donor',
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
                                      '\nQuickly find volunteers willing to donate blood or recruit them for the your next Blood Donation Campaign.',
                                  style: TextStyle(
                                    color: drkmd == true
                                        ? HexColor('#bebebe')
                                        : Colors.grey[800],
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                TextSpan(
                                  text: '\nConsult A Doctor',
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
                                      '\nGet a free consultation with doctors regarding your minor health problems and queries. You can then directly meet up or schedule an appointment later if you decided to get further assistance.',
                                  style: TextStyle(
                                    color: drkmd == true
                                        ? HexColor('#bebebe')
                                        : Colors.grey[800],
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                TextSpan(
                                  text: '\nExplore',
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
                                      '\nQuickly Read articles curated by medical professionals about daily health, advancement in healths and offers for your health checkup. ',
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
