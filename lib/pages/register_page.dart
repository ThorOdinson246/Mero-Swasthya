import 'package:testapp1/allpages.dart';
import 'package:testapp1/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

// TextEditingController classes;

class _RegisterPageState extends State<RegisterPage> {
  String? name;
  String? lastName;
  String? grade;
  String? school;
  String? favSub;
  final _myController = TextEditingController();
  final _myLastName = TextEditingController();
  final _myGrade = TextEditingController();
  final _mySchool = TextEditingController();
  final _myFavSub = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  save() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setString('nm', _myController.text);
    sharedPrefs.setString('lstnm', _myLastName.text);
    sharedPrefs.setString('grd', _myGrade.text);
    sharedPrefs.setString('sch', _mySchool.text);
    sharedPrefs.setString('favsub', _myFavSub.text);
    sharedPrefs.setBool('isLogged', true);
    sharedPrefs.setInt('quiz', 0);

    print('record added');
  }

  get() async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    String pastdata = sharedPrefs.getString('nm').toString();
    print('geting record');
    print('pastdata' + pastdata);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[900],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(80),
                  bottomRight: Radius.circular(0),
                ),
              ),
              child: Column(
                children: [
                  Image.asset(
                    'images/sign_in.png',
                    height: MediaQuery.of(context).size.height / 2.5,
                  ),
                  Text(
                    'Register',
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w900,
                      color: Colors.yellow[900],
                      fontSize: 25,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 10, 25, 5),
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey[300],
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 2.0, 0, 2.0),
                  child: TextField(
                    controller: _myController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'First Name',
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 10, 25, 5),
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey[300],
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 2.0, 0, 2.0),
                  child: TextField(
                    controller: _myLastName,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Last Name',
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 10, 25, 5),
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey[300],
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 2.0, 0, 2.0),
                  child: TextField(
                    controller: _myGrade,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Grade',
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 10, 25, 5),
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey[300],
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 2.0, 0, 2.0),
                  child: TextField(
                    controller: _mySchool,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'School\'s Name',
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 10, 25, 5),
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey[300],
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 2.0, 0, 2.0),
                  child: TextField(
                    controller: _myFavSub,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Fav Topic',
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),

                // textColor: Colors.black,
                color: Colors.yellow[800],
                // splashColor: Colors.red[700],
                child: Text(
                  'Register',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                onPressed: () {
                  save();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => MyHomePage()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
