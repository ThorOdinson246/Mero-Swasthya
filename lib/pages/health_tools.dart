import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:testapp1/pages/bmi_calculator.dart';
import 'package:testapp1/pages/bpm.dart';
import 'package:testapp1/pages/homepage.dart';
import 'package:testapp1/pages/ibw_calculator.dart';
import 'package:testapp1/pages/medicine_reminder.dart';
import 'package:testapp1/pages/quiz.dart';

import 'settings.dart';

class HealthTools extends StatefulWidget {
  const HealthTools({Key? key}) : super(key: key);

  @override
  State<HealthTools> createState() => _HealthToolsState();
}

class _HealthToolsState extends State<HealthTools> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 50,
        elevation: 0,
        backgroundColor: Color(0xff0984e3),
        title: Text(
          'Health Utiltities',
          style: TextStyle(
            fontFamily: 'SuezOne',
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: drkmd == true ? Colors.grey[900] : Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BMICalculator(),
                    ),
                  );
                },
                child: Container(
                  // margin: const EdgeInsets.all(10),
                  height: 100,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: drkmd == true
                        ? HexColor('#444444')
                        : HexColor('#dfe6e9'),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 5, 10, 5),
                    child: Row(
                      children: [
                        const Expanded(
                          flex: 1,
                          child: CircleAvatar(
                            radius: 30,
                            child: Icon(
                              Icons.calculate_outlined,
                              size: 45,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(15, 0, 8, 1),
                                child: Text(
                                  'BMI Calculator',
                                  style: TextStyle(
                                    color: drkmd == true
                                        ? HexColor('#bebebe')
                                        : HexColor('#636e72'),
                                    fontSize: 20,
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(15, 0, 8, 0),
                                child: Text(
                                  'Body Mass Index(BMI) is a person\'s weight in kilogram divided by the square of height in meters. A high BMI can indicate high body fatness. BMI screens for weight categories that may lead to health problems, but it does not diagnose the body fatness or health of an individual.',
                                  maxLines: 3,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    color: drkmd == true
                                        ? HexColor('#bebebe')
                                        : HexColor('#636e72'),
                                    fontSize: 15,
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w400,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const IBWCalculator(),
                    ),
                  );
                },
                child: Container(
                  // margin: const EdgeInsets.all(10),
                  height: 100,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: drkmd == true
                        ? HexColor('#444444')
                        : HexColor('#dfe6e9'),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 5, 10, 5),
                    child: Row(
                      children: [
                        const Expanded(
                          flex: 1,
                          child: CircleAvatar(
                            radius: 30,
                            child: Icon(
                              Icons.add_box_rounded,
                              size: 45,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(15, 0, 8, 1),
                                child: Text(
                                  'IBW Calculator',
                                  style: TextStyle(
                                    color: drkmd == true
                                        ? HexColor('#bebebe')
                                        : HexColor('#636e72'),
                                    fontSize: 20,
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(15, 0, 8, 0),
                                child: Text(
                                  'Ideal Body Weight(IBW) us a clinical standard that incorporates biometric variables including height, gender and age. It is used to determine the proper dosage of prescibed medications for patients, and in sports to measure body weight according to a classification scale',
                                  maxLines: 3,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    color: drkmd == true
                                        ? HexColor('#bebebe')
                                        : HexColor('#636e72'),
                                    fontSize: 15,
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w400,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizPage(),
                    ),
                  );
                },
                child: Container(
                  // margin: const EdgeInsets.all(10),
                  height: 100,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: drkmd == true
                        ? HexColor('#444444')
                        : HexColor('#dfe6e9'),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 5, 10, 5),
                    child: Row(
                      children: [
                        const Expanded(
                          flex: 1,
                          child: CircleAvatar(
                            radius: 30,
                            child: Icon(
                              Icons.stream_sharp,
                              size: 45,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(15, 0, 8, 1),
                                child: Text(
                                  'Anxiety Self Test',
                                  style: TextStyle(
                                    color: drkmd == true
                                        ? HexColor('#bebebe')
                                        : HexColor('#636e72'),
                                    fontSize: 20,
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(15, 0, 8, 0),
                                child: Text(
                                  'This anxiety self test can give you an understanding of the likelihood that you have an anxiety disorder. Please note, results are not a diagnosis.',
                                  maxLines: 3,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    color: drkmd == true
                                        ? HexColor('#bebebe')
                                        : HexColor('#636e72'),
                                    fontSize: 15,
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w400,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: drkmd == true
                              ? Colors.grey[900]
                              : Colors.grey[100],
                          title: Text(
                            "BPM",
                            style: TextStyle(
                              color: drkmd == true
                                  ? HexColor('#bebebe')
                                  : HexColor('#636e72'),
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('OK'),
                            )
                          ],
                          content: Text(
                            "This feature is currently under development. It will me made available soon.",
                            style: TextStyle(
                              color: drkmd == true
                                  ? HexColor('#bebebe')
                                  : HexColor('#636e72'),
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        );
                      });
                },
                child: Container(
                  // margin: const EdgeInsets.all(10),
                  height: 100,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: drkmd == true
                        ? HexColor('#444444')
                        : HexColor('#dfe6e9'),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 5, 10, 5),
                    child: Row(
                      children: [
                        const Expanded(
                          flex: 1,
                          child: CircleAvatar(
                            radius: 30,
                            child: Icon(
                              Icons.heart_broken,
                              size: 45,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(15, 0, 8, 1),
                                child: Text(
                                  'BPM',
                                  style: TextStyle(
                                    color: drkmd == true
                                        ? HexColor('#bebebe')
                                        : HexColor('#636e72'),
                                    fontSize: 20,
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(15, 0, 8, 0),
                                child: Text(
                                  'BPM measures your heart rate with the help of the camera sensor in your device to provide you with accurate results to diagnose problems and conditions.',
                                  maxLines: 3,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    color: drkmd == true
                                        ? HexColor('#bebebe')
                                        : HexColor('#636e72'),
                                    fontSize: 15,
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w400,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MedReminder(title: ''),
                    ),
                  );
                },
                child: Container(
                  // margin: const EdgeInsets.all(10),
                  height: 100,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: drkmd == true
                        ? HexColor('#444444')
                        : HexColor('#dfe6e9'),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 5, 10, 5),
                    child: Row(
                      children: [
                        const Expanded(
                          flex: 1,
                          child: CircleAvatar(
                            radius: 30,
                            child: Icon(
                              Icons.heart_broken,
                              size: 45,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(15, 0, 8, 1),
                                child: Text(
                                  'Med Reminder',
                                  style: TextStyle(
                                    color: drkmd == true
                                        ? HexColor('#bebebe')
                                        : HexColor('#636e72'),
                                    fontSize: 20,
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(15, 0, 8, 0),
                                child: Text(
                                  'BPM measures your heart rate with the help of the camera sensor in your device to provide you with accurate results to diagnose problems and conditions.',
                                  maxLines: 3,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    color: drkmd == true
                                        ? HexColor('#bebebe')
                                        : HexColor('#636e72'),
                                    fontSize: 15,
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w400,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
