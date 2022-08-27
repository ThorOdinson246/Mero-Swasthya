// import 'package:flutter/material.dart';

// class QuizPage extends StatefulWidget {
//   @override
//   _QuizPageState createState() => _QuizPageState();
// }

// class _QuizPageState extends State<QuizPage> {
//   Color _color = Color.fromRGBO(189, 189, 189, 1);
//   Color _color2 = Color.fromRGBO(189, 189, 189, 1);
//   String congratsmsg = '';

//   int index = 0;
//   int answerindex = 0;
//   int score = 0;
//   bool visibli = false;
//   bool visiblinxt = true;
//   int optionaclicked = 0;
//   int optionbclicked = 0;
//   int optioncclicked = 0;
//   int optiondclicked = 0;

//   List Questions = <String>[
//     ' This is a sample test question 1  ',
//     'This is a sample test question 2 ',
//     ' Question 4 ',
//     'Question 5',
//     'Question 6',
//     'Question 7 ',
//     'Question 8 '
//   ];
//   List Answers = <List>[
//     ['1', '2', '3'],
//     ['a', 'b', 'c'],
//     ['A', 'B', 'C'],
//     ['@', '#', '/'],
//     ['an', 'oth', 'er'],
//     ['tw', 'o', 'an'],
//     ['las1', 'las2', 'las3']
//   ];
//   List CorrectAnswers = <List>[
//     [true, false, false],
//     [false, true, false],
//     [false, false, true],
//     [false, true, false],
//     [true, false, false],
//     [false, true, false],
//     [false, false, true]
//   ];

//   // List Answers=<>
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       backgroundColor: Color(0xff1a1a2e),
//       appBar: AppBar(
//         centerTitle: true,
//         toolbarHeight: 50,
//         elevation: 0,
//         backgroundColor: Color(0xff0404f1),
//         title: Text(
//           'Quiz',
//           style: TextStyle(
//             fontFamily: 'SuezOne',
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               width: width,
//               decoration: BoxDecoration(
//                 color: Color(0xff0404f1),
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(30),
//                   bottomRight: Radius.circular(30),
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         Expanded(
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Total Questions:' +
//                                     Questions.length.toString(),
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.w700,
//                                   fontSize: 17,
//                                   fontFamily: 'Nunito',
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Expanded(
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: [
//                               Text(
//                                 'Score:' + score.toString(),
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.w700,
//                                   fontSize: 17,
//                                   fontFamily: 'Nunito',
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.fromLTRB(15, 4, 25, 8),
//                       child: Text(
//                         'QN${index + 1}.' + ' ' + Questions[index],
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontFamily: 'Nunito',
//                           fontSize: 23,
//                           fontWeight: FontWeight.w900,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 40),
//             // Padding(
//             //   padding: const EdgeInsets.fromLTRB(15, 4, 25, 8),
//             //   child: Text(
//             //     'QN${index + 1}.' + ' ' + Questions[index],
//             //     style: TextStyle(
//             //       color: Colors.white,
//             //       fontFamily: 'Nunito',
//             //       fontSize: 23,
//             //       fontWeight: FontWeight.w900,
//             //     ),
//             //   ),
//             // ),
//             Padding(
//               padding: const EdgeInsets.fromLTRB(15, 4, 15, 8),
//               child: InkWell(
//                 borderRadius: BorderRadius.circular(15),
//                 onTap: () {
//                   print(CorrectAnswers[index][answerindex]);

//                   setState(() {
//                     if (optionaclicked == 0) {
//                       CorrectAnswers[index][answerindex] == true
//                           ? score += 1
//                           : score = score;
//                       // _color = Color.fromRGBO(211, 47, 47, 1);
//                       _color2 = Color.fromRGBO(156, 204, 101, 1);
//                     }
//                     optionaclicked = 1;
//                     optionbclicked = 1;
//                     optioncclicked = 1;
//                     optiondclicked = 1;
//                     print('optionaclicked=' + '${optionaclicked}');
//                     // if (index < Questions.length - 1) {
//                     //   Future.delayed(
//                     //     Duration(seconds: 1),
//                     //     () {
//                     //       setState(() {
//                     //         // index += 1;
//                     //         _color = Colors.grey[400];
//                     //         _color2 = Colors.grey[400];
//                     //       });
//                     //     },
//                     //   );
//                     // }

//                     if (index == Questions.length - 1) {
//                       setState(() {
//                         congratsmsg =
//                             'Congrats,Your Quiz for Physics is Completed';
//                         visibli = true;
//                         visiblinxt = false;
//                         score == score.toString();
//                       });
//                     }
//                   });
//                 },
//                 child: AnimatedContainer(
//                   height: 45,
//                   width: width,
//                   decoration: BoxDecoration(
//                     boxShadow: [
//                       BoxShadow(
//                         offset: Offset(2, 3),
//                         blurRadius: 3,
//                         color: Color.fromRGBO(224, 224, 224, 1),
//                       )
//                     ],
//                     borderRadius: BorderRadius.circular(18),
//                     color: CorrectAnswers[index][answerindex] == true
//                         ? _color2
//                         : _color,
//                   ),
//                   duration: Duration(seconds: 1),
//                   curve: Curves.fastLinearToSlowEaseIn,
//                   child: Center(
//                     child: Text(
//                       Answers[index][answerindex],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Padding(
//               padding: const EdgeInsets.fromLTRB(15, 4, 15, 8),
//               child: InkWell(
//                 borderRadius: BorderRadius.circular(15),
//                 onTap: () {
//                   print(CorrectAnswers[index][answerindex + 1]);

//                   setState(() {
//                     if (optionbclicked == 0) {
//                       CorrectAnswers[index][answerindex + 1] == true
//                           ? score += 1
//                           : score = score;
//                       // _color = Color.fromRGBO(211, 47, 47, 1);
//                       _color2 = Color.fromRGBO(156, 204, 101, 1);
//                     }
//                     optionaclicked = 1;
//                     optionbclicked = 1;
//                     optioncclicked = 1;
//                     optiondclicked = 1;
//                     print('optionbclicked=' + '${optionbclicked}');
//                     // if (index < Questions.length - 1) {
//                     //   Future.delayed(
//                     //     Duration(seconds: 1),
//                     //     () {
//                     //       setState(() {
//                     //         // index += 1;
//                     //         _color = Colors.grey[400];
//                     //         _color2 = Colors.grey[400];
//                     //       });
//                     //     },
//                     //   );
//                     // }
//                     if (index == Questions.length - 1) {
//                       setState(() {
//                         congratsmsg =
//                             'Congrats,Your Quiz for Physics is Completed';
//                         score == score.toString();
//                         visibli = true;
//                         visiblinxt = false;
//                       });
//                     }
//                   });
//                 },
//                 child: AnimatedContainer(
//                   child: Center(child: Text(Answers[index][answerindex + 1])),
//                   width: width,
//                   height: 45,
//                   decoration: BoxDecoration(
//                     boxShadow: [
//                       BoxShadow(
//                         offset: Offset(2, 3),
//                         blurRadius: 3,
//                         color: Color.fromRGBO(224, 224, 224, 1),
//                       )
//                     ],
//                     color: CorrectAnswers[index][answerindex + 1] == true
//                         ? _color2
//                         : _color,
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   duration: Duration(seconds: 1),
//                   curve: Curves.fastLinearToSlowEaseIn,
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Padding(
//               padding: const EdgeInsets.fromLTRB(15, 4, 15, 8),
//               child: InkWell(
//                 borderRadius: BorderRadius.circular(15),
//                 onTap: () {
//                   print(CorrectAnswers[index][answerindex + 2]);

//                   setState(() {
//                     if (optioncclicked == 0) {
//                       CorrectAnswers[index][answerindex + 2] == true
//                           ? score += 1
//                           : score = score;
//                       // _color = Color.fromRGBO(211, 47, 47, 1);
//                       _color2 = Color.fromRGBO(156, 204, 101, 1);
//                     }
//                     optionaclicked = 1;
//                     optionbclicked = 1;
//                     optioncclicked = 1;
//                     optiondclicked = 1;
//                     print('optioncclicked' + '${optioncclicked}');
//                     // if (index < Questions.length - 1) {
//                     //   Future.delayed(
//                     //     Duration(seconds: 1),
//                     //     () {
//                     //       setState(() {
//                     //         // index += 1;
//                     //         _color = Colors.grey[400];
//                     //         _color2 = Colors.grey[400];
//                     //       });
//                     //     },
//                     //   );
//                     // }
//                     if (index == Questions.length - 1) {
//                       setState(() {
//                         congratsmsg =
//                             'Congrats,Your quiz is Completed. You may now access your diagnostic.';
//                         score == score.toString();
//                         visiblinxt = false;
//                         visibli = true;
//                       });
//                     }
//                   });
//                 },
//                 child: AnimatedContainer(
//                   child: Center(
//                     child: Text(
//                       Answers[index][answerindex + 2],
//                     ),
//                   ),
//                   width: width,
//                   height: 45,
//                   decoration: BoxDecoration(
//                     boxShadow: [
//                       BoxShadow(
//                         offset: Offset(2, 3),
//                         blurRadius: 3,
//                         color: Color.fromRGBO(158, 158, 158, 1),
//                       )
//                     ],
//                     borderRadius: BorderRadius.circular(15),
//                     color: CorrectAnswers[index][answerindex + 2] == true
//                         ? _color2
//                         : _color,
//                   ),
//                   duration: Duration(seconds: 1),
//                   curve: Curves.fastLinearToSlowEaseIn,
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Padding(
//               padding: const EdgeInsets.fromLTRB(15, 4, 15, 8),
//               child: InkWell(
//                 borderRadius: BorderRadius.circular(15),
//                 onTap: () {
//                   print(CorrectAnswers[index][answerindex+3]);

//                   setState(() {
//                     if (optiondclicked == 0) {
//                       CorrectAnswers[index][answerindex+3] == true
//                           ? score += 1
//                           : score = score;
//                       // _color = Color.fromRGBO(211, 47, 47, 1);
//                       _color2 = Color.fromRGBO(156, 204, 101, 1);
//                     }
//                     optionaclicked = 1;
//                     optionbclicked = 1;
//                     optioncclicked = 1;
//                     optiondclicked = 1;
//                     print('optiondclicked=' + '${optiondclicked}');
//                     // if (index < Questions.length - 1) {
//                     //   Future.delayed(
//                     //     Duration(seconds: 1),
//                     //     () {
//                     //       setState(() {
//                     //         // index += 1;
//                     //         _color = Colors.grey[400];
//                     //         _color2 = Colors.grey[400];
//                     //       });
//                     //     },
//                     //   );
//                     // }

//                     if (index == Questions.length - 1) {
//                       setState(() {
//                         congratsmsg =
//                         'Congrats,Your Quiz for Physics is Completed';
//                         visibli = true;
//                         visiblinxt = false;
//                         score == score.toString();
//                       });
//                     }
//                   });
//                 },
//                 child: AnimatedContainer(
//                   height: 45,
//                   width: width,
//                   decoration: BoxDecoration(
//                     boxShadow: [
//                       BoxShadow(
//                         offset: Offset(2, 3),
//                         blurRadius: 3,
//                         color: Color.fromRGBO(224, 224, 224, 1),
//                       )
//                     ],
//                     borderRadius: BorderRadius.circular(18),
//                     color: CorrectAnswers[index][answerindex+3] == true
//                         ? _color2
//                         : _color,
//                   ),
//                   duration: Duration(seconds: 1),
//                   curve: Curves.fastLinearToSlowEaseIn,
//                   child: Center(
//                     child: Text(
//                       Answers[index][answerindex+3],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Center(
//                 child: Text(
//                   congratsmsg,
//                   style: TextStyle(
//                     fontWeight: FontWeight.w900,
//                     fontSize: 17,
//                     fontFamily: 'Nunito',
//                     color: Color(0xff0404f1),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 40,
//               child: Visibility(
//                 visible: visiblinxt,
//                 child: Center(
//                   child: FlatButton(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(18),
//                     ),
//                     onPressed: () {
//                       if (index < Questions.length) {
//                         setState(() {
//                           index += 1;
//                           _color = Color.fromRGBO(189, 189, 189, 1);
//                           _color2 = Color.fromRGBO(189, 189, 189, 1);
//                           optionaclicked = 0;
//                           optionbclicked = 0;
//                           optioncclicked = 0;
//                           optiondclicked=0;
//                         });
//                       }
//                     },
//                     color: Colors.blue,
//                     child: Text(
//                       'NEXT',
//                       style: TextStyle(
//                         fontWeight: FontWeight.w900,
//                         fontSize: 17,
//                         fontFamily: 'Nunito',
//                         color: Color(0xffffffff),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),

//             SizedBox(
//               height: 20,
//             ),
//             Visibility(
//               visible: visibli,
//               child: Center(
//                 child: FlatButton(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(18),
//                   ),
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   color: Colors.blue,
//                   child: Text(
//                     'Take another Quiz',
//                     style: TextStyle(
//                       fontWeight: FontWeight.w900,
//                       fontSize: 17,
//                       fontFamily: 'Nunito',
//                       color: Color(0xffffffff),
//                     ),
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
