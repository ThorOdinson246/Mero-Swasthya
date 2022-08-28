import 'package:google_sign_in/google_sign_in.dart';
import 'package:testapp1/allpages.dart';
import 'package:testapp1/pages/googlesignin.dart';
import 'package:testapp1/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testapp1/pages/splash.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

// TextEditingController classes;
final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

class _RegisterPageState extends State<RegisterPage> {
  GoogleSignInAccount? _currentUser;
  String? name;
  String? lastName;
  String? grade;
  String? school;
  String? favSub;
  final _myController = TextEditingController();
  final _myLastName = TextEditingController();
  final _phoneno = TextEditingController();
  final _mySchool = TextEditingController();
  final _myFavSub = TextEditingController();

  @override
  void initState() {
    super.initState();
    final googleSignIn = GoogleSignIn();
    googleSignIn.disconnect();
  }

  save() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    // sharedPrefs.setString('nm', _myController.text);
    // sharedPrefs.setString('lstnm', _myLastName.text);
    // sharedPrefs.setString('grd', _phoneno.text);
    // sharedPrefs.setString('sch', _mySchool.text);
    // sharedPrefs.setString('favsub', _myFavSub.text);
    sharedPrefs.setBool('isLogged', true);
    sharedPrefs.setInt('quiz', 0);

    // print('record added');
  }

  get() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    // String pastdata = sharedPrefs.getString('nm').toString();
    print('geting record');
    // print('pastdata' + pastdata);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[900],
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30), color: Colors.white
                    // drkmd == true ? HexColor('#444444') : HexColor('#dfe6e9'),
                    ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 10, 20, 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'images/sign_in.png',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Text(
                          'Register',
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w900,
                            color: Colors.yellow[900],
                            fontSize: 35,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: _myController,
                        style: TextStyle(
                          color:
                              drkmd == true ? Colors.white : Colors.grey[600],
                        ),
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(40),
                              right: Radius.circular(40),
                            ),
                            borderSide:
                                BorderSide(color: Colors.red, width: 5.0),
                          ),
                          labelText: 'First Name',
                          labelStyle: TextStyle(
                            color:
                                drkmd == true ? Colors.white : Colors.grey[600],
                          ),
                          prefixIcon: Icon(
                            Icons.people,
                            color:
                                drkmd == true ? Colors.white : Colors.grey[600],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      TextField(
                        style: TextStyle(
                          color:
                              drkmd == true ? Colors.white : Colors.grey[600],
                        ),
                        controller: _myLastName,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(40),
                              right: Radius.circular(40),
                            ),
                            borderSide:
                                BorderSide(color: Colors.red, width: .0),
                          ),
                          labelText: 'Last Name',
                          labelStyle: TextStyle(
                            color:
                                drkmd == true ? Colors.white : Colors.grey[600],
                          ),
                          prefixIcon: Icon(
                            Icons.phone_android,
                            color:
                                drkmd == true ? Colors.white : Colors.grey[600],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextField(
                        style: TextStyle(
                          color:
                              drkmd == true ? Colors.white : Colors.grey[600],
                        ),
                        keyboardType: TextInputType.number,
                        controller: _phoneno,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(40),
                              right: Radius.circular(40),
                            ),
                            borderSide:
                                BorderSide(color: Colors.red, width: 5.0),
                          ),
                          labelText: 'Phone no ',
                          labelStyle: TextStyle(
                            color:
                                drkmd == true ? Colors.white : Colors.grey[600],
                          ),
                          prefixIcon: Icon(
                            Icons.phone_android,
                            color:
                                drkmd == true ? Colors.white : Colors.grey[600],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextField(
                        style: TextStyle(
                          color:
                              drkmd == true ? Colors.white : Colors.grey[600],
                        ),
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        controller: _mySchool,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(40),
                              right: Radius.circular(40),
                            ),
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 5.0,
                            ),
                          ),
                          labelText: 'Field 4 ',
                          labelStyle: TextStyle(
                            color:
                                drkmd == true ? Colors.white : Colors.grey[600],
                          ),
                          prefixIcon: Icon(
                            Icons.bloodtype_outlined,
                            color:
                                drkmd == true ? Colors.white : Colors.grey[600],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextField(
                        style: TextStyle(
                          color:
                              drkmd == true ? Colors.white : Colors.grey[600],
                        ),
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        controller: _myFavSub,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(40),
                              right: Radius.circular(40),
                            ),
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 5.0,
                            ),
                          ),
                          labelText: 'Field 5 ',
                          labelStyle: TextStyle(
                            color:
                                drkmd == true ? Colors.white : Colors.grey[600],
                          ),
                          prefixIcon: Icon(
                            Icons.book,
                            color:
                                drkmd == true ? Colors.white : Colors.grey[600],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.yellow[800],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          // textColor: Colors.black,

                          // splashColor: Colors.red[700],
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                              child: Text(
                                'Register',
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'Nunito',
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyHomePage()));
                            save();
                          },
                        ),
                      ),
                      Center(
                        child: GoogleButton(),
                      )
                    ],
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(25, 10, 25, 5),
              //   child: TextField(
              //     controller: _myController,
              //     decoration: InputDecoration(
              //       border: const OutlineInputBorder(
              //         borderRadius: BorderRadius.horizontal(
              //           left: Radius.circular(40),
              //           right: Radius.circular(40),
              //         ),
              //         borderSide: BorderSide(color: Colors.red, width: 5.0),
              //       ),
              //       labelText: 'Name',
              //       labelStyle: TextStyle(
              //         color: drkmd == true ? Colors.white : Colors.grey[600],
              //       ),
              //       prefixIcon: Icon(
              //         Icons.people,
              //         color: drkmd == true ? Colors.white : Colors.grey[600],
              //       ),
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(25, 10, 25, 5),
              //   child: Container(
              //     height: 45,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(30),
              //       color: Colors.grey[300],
              //     ),
              //     child: Padding(
              //       padding: const EdgeInsets.fromLTRB(12.0, 2.0, 0, 2.0),
              //       child: TextField(
              //         controller: _myLastName,
              //         decoration: InputDecoration(
              //           border: InputBorder.none,
              //           hintText: 'Last Name',
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(25, 10, 25, 5),
              //   child: Container(
              //     height: 45,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(30),
              //       color: Colors.grey[300],
              //     ),
              //     child: Padding(
              //       padding: const EdgeInsets.fromLTRB(12.0, 2.0, 0, 2.0),
              //       child: TextField(
              //         controller: _phoneno,
              //         decoration: InputDecoration(
              //           border: InputBorder.none,
              //           hintText: 'Grade',
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(25, 10, 25, 5),
              //   child: Container(
              //     height: 45,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(30),
              //       color: Colors.grey[300],
              //     ),
              //     child: Padding(
              //       padding: const EdgeInsets.fromLTRB(12.0, 2.0, 0, 2.0),
              //       child: TextField(
              //         controller: _mySchool,
              //         decoration: InputDecoration(
              //           border: InputBorder.none,
              //           hintText: 'School\'s Name',
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(25, 10, 25, 5),
              //   child: Container(
              //     height: 45,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(30),
              //       color: Colors.grey[300],
              //     ),
              //     child: Padding(
              //       padding: const EdgeInsets.fromLTRB(12.0, 2.0, 0, 2.0),
              //       child: TextField(
              //         controller: _myFavSub,
              //         decoration: InputDecoration(
              //           border: InputBorder.none,
              //           hintText: 'Fav Topic',
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              // SizedBox(height: 10),
              // Center(
              //   child: RaisedButton(
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(30),
              //     ),

              //     // textColor: Colors.black,
              //     color: Colors.yellow[800],
              //     // splashColor: Colors.red[700],
              //     child: Text(
              //       'Register',
              //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              //     ),
              //     onPressed: () {
              //       save();
              //       Navigator.pushReplacement(context,
              //           MaterialPageRoute(builder: (context) => MyHomePage()));
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  void signOut() {
    final googleSignIn = GoogleSignIn();
    googleSignIn.disconnect();
    // googleSignIn.disconnect();
  }
}
