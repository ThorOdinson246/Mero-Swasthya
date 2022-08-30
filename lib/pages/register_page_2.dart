import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testapp1/pages/googlesignin.dart';
import 'package:testapp1/pages/homepage.dart';

import '../allpages.dart';

class RegisterPageTwo extends StatefulWidget {
  const RegisterPageTwo({Key? key}) : super(key: key);

  @override
  State<RegisterPageTwo> createState() => _RegisterPageTwoState();
}

class _RegisterPageTwoState extends State<RegisterPageTwo> {
  final _myController = TextEditingController();
  final _myLastName = TextEditingController();
  final _phoneno = TextEditingController();
  final _location = TextEditingController();
  final _myFavSub = TextEditingController();

  final FirebaseAuth authInstance = FirebaseAuth.instance;
  save() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    // sharedPrefs.setString('nm', _myController.text);
    // sharedPrefs.setString('lstnm', _myLastName.text);
    // sharedPrefs.setString('grd', _phoneno.text);
    // sharedPrefs.setString('sch', _location.text);
    // sharedPrefs.setString('favsub', _myFavSub.text);
    sharedPrefs.setBool('isLogged', true);
    sharedPrefs.setInt('quiz', 0);

    // print('record added');
  }

  Future<void> _userDetailsAdd(context) async {
    final googleSignIn = GoogleSignIn();
    final googleAccount = await googleSignIn.signIn();
    if (googleAccount != null) {
      final googleAuth = await googleAccount.authentication;
      final authResult = await authInstance.signInWithCredential(
        GoogleAuthProvider.credential(
            idToken: googleAuth.idToken, accessToken: googleAuth.accessToken),
      );
      await FirebaseFirestore.instance
          .collection('users')
          .doc(authResult.user!.uid)
          .set({
        'id': authResult.user!.uid,
        'name': authResult.user!.displayName, // ask for name
        'email': authResult.user!.email,
        'phone': _phoneno.text,
        'location': _location.text,
        'field2': '',
        'createdAt': Timestamp.now(),
      });

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const MyHomePage(),
        ),
      );
    }
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
                          color: Colors.grey[600],
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
                            color: Colors.grey[600],
                          ),
                          prefixIcon: Icon(
                            Icons.people,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      TextField(
                        style: TextStyle(
                          color: Colors.grey[600],
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
                            color: Colors.grey[600],
                          ),
                          prefixIcon: Icon(
                            Icons.phone_android,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextField(
                        style: TextStyle(
                          color: Colors.grey[600],
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
                            color: Colors.grey[600],
                          ),
                          prefixIcon: Icon(
                            Icons.phone_android,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextField(
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                        // keyboardType: const TextInputType.numberWithOptions(
                        // decimal: true),
                        controller: _location,
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
                            color: Colors.grey[600],
                          ),
                          prefixIcon: Icon(
                            Icons.location_on,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextField(
                        style: TextStyle(
                          color: Colors.grey[600],
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
                            color: Colors.grey[600],
                          ),
                          prefixIcon: Icon(
                            Icons.book,
                            color: Colors.grey[600],
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
                            _userDetailsAdd(context);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyHomePage()));
                            save();
                          },
                        ),
                      ),
                      // Center(
                      //   child: GoogleButton(),
                      // )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
