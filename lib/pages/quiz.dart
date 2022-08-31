// ignore_for_file: prefer_const_constructors

// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../lists/questions_lists.dart';
import 'homepage.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  Color _colora = HexColor('#dfe6e9');
  Color _colorgreen = Colors.green;
  Color _colorb = HexColor('#dfe6e9');
  Color _colorgrey = HexColor('#dfe6e9');
  Color _colorc = HexColor('#dfe6e9');
  Color _colord = HexColor('#dfe6e9');
  // Color _colorc2 = Colors.green;
  String congratsmsg = '';
  saveQuiz() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setInt('quiz', score);
    print('quiz record added');
  }

  int index = 0;
  int answerindex = 0;
  dynamic score = 0;
  String scoreresult = 'normal';
  String completed = 'normal';
  bool visibli = false;
  bool visiblinxt = true;
  int optionclicked = 4;
  bool isVisible = true;

  // List Answers=<>
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    print('index= ' + '$index');
    return Scaffold(
      backgroundColor: Color(0xff1a1a2e),
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 50,
        elevation: 0,
        backgroundColor: Color(0xff0404f1),
        title: Text(
          'Anxiety Check',
          style: TextStyle(
            fontFamily: 'SuezOne',
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Visibility(
              visible: isVisible,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: width,
                    decoration: BoxDecoration(
                      color: Color(0xff0404f1),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Total Questions: ' +
                                          Questions.length.toString(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 17,
                                        fontFamily: 'Nunito',
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      '',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 17,
                                        fontFamily: 'Nunito',
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 4, 25, 8),
                            child: Text(
                              'QN${index + 1}.' + ' ' + Questions[index],
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Nunito',
                                fontSize: 23,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 10, 10, 10),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            alignment: Alignment.centerLeft,
                            backgroundColor: _colora,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                            ),
                          ),
                          onPressed: () {
                            optionclicked = 0;
                            setState(() {
                              _colora = _colorgreen;
                              _colorb = _colorgrey;
                              _colorc = _colorgrey;
                              _colord = _colorgrey;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 4, 4, 4),
                            child: Text(
                              'A. ' + Options[answerindex][0].toString(),
                              style: TextStyle(
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 10, 10, 10),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            alignment: Alignment.centerLeft,
                            backgroundColor: _colorb,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                            ),
                          ),
                          onPressed: () {
                            optionclicked = 1;
                            setState(
                              () {
                                _colora = _colorgrey;
                                _colorb = _colorgreen;
                                _colorc = _colorgrey;
                                _colord = _colorgrey;
                              },
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 5, 4, 5),
                            child: Text(
                              'B. ' + Options[answerindex][1].toString(),
                              style: TextStyle(
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 10, 10, 10),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            alignment: Alignment.centerLeft,
                            backgroundColor: _colorc,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                            ),
                          ),
                          onPressed: () {
                            optionclicked = 2;
                            setState(
                              () {
                                _colora = _colorgrey;
                                _colorb = _colorgrey;
                                _colorc = _colorgreen;
                                _colord = _colorgrey;
                              },
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 5, 4, 5),
                            child: Text(
                              'C. ' + Options[answerindex][2].toString(),
                              style: TextStyle(
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 10, 10, 10),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            alignment: Alignment.centerLeft,
                            backgroundColor: _colord,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                            ),
                          ),
                          onPressed: () {
                            optionclicked = 3;
                            setState(
                              () {
                                _colora = _colorgrey;
                                _colorb = _colorgrey;
                                _colorc = _colorgrey;
                                _colord = _colorgreen;
                              },
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8.0, 5, 4, 5),
                            child: Text(
                              'D. ' + Options[answerindex][3].toString(),
                              style: TextStyle(
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                          ),
                        ),
                        child: Text(
                          index != Questions.length - 1
                              ? '  Next  '
                              : '  Finish  ',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        onPressed: () {
                          if (index != Questions.length - 1) {
                            if (optionclicked != 4) {
                              setState(
                                () {
                                  index = index + 1;
                                  _colora =
                                      _colorb = _colorc = _colord = _colorgrey;
                                  answerindex += 1;
                                  score += Marks[index][optionclicked];
                                  optionclicked = 4;
                                },
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please select an option'),
                                  behavior: SnackBarBehavior.floating,
                                ),
                              );
                            }
                          } else {
                            setState(
                              () {
                                isVisible = !isVisible;
                                score += Marks[index][optionclicked];
                                optionclicked = 4;
                                if (score <= 5) {
                                  setState(() {
                                    scoreresult = 'normal';
                                    completed =
                                        'You need not worry. Your anxiety is very normal. Live out the rest of your days as cheerful and happy as you are now';
                                  });
                                }
                                if (score >= 5 && score <= 10) {
                                  setState(() {
                                    scoreresult = 'mild';
                                    completed =
                                        'You have a slight level of anxiety. It is perfectly normal but you may want to change your habit. ';
                                  });
                                }
                                if (score > 10 && score <= 15) {
                                  setState(() {
                                    scoreresult = 'severe';
                                    completed =
                                        'You have a concerning anxiety level. It would be best if you seek a doctors help.';
                                  });
                                }
                                if (score > 15 && score <= 21) {
                                  setState(() {
                                    scoreresult = 'panic';
                                    completed =
                                        'You have severe anxiety. Please contact a medical professional as soon as possible. You can give us a call as well. ';
                                  });
                                }
                              },
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Visibility(
              visible: !isVisible,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Your anxiety level is ',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Nunito',
                                fontSize: 23,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            TextSpan(
                              text: '$scoreresult',
                              style: TextStyle(
                                color: scoreresult == 'normal'
                                    ? Colors.green
                                    : scoreresult == 'mild'
                                        ? Colors.yellow
                                        : scoreresult == 'severe'
                                            ? Colors.yellow[900]
                                            : Colors.red,
                                fontFamily: 'Nunito',
                                fontSize: 23,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Suggestions: \n',
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontFamily: 'Nunito',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    TextSpan(
                                      text: completed,
                                      style: TextStyle(
                                        // color: Colors.green,
                                        fontFamily: 'Nunito',
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                          ),
                        ),
                        onPressed: () {
                          saveQuiz();
                          Navigator.pop(context);
                          // optionclicked = 4;
                        },
                        child: Text(
                          index != Questions.length - 1 ? 'Next' : 'Exit',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ],
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
