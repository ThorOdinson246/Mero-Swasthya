import 'package:testapp1/allpages.dart';
import 'package:testapp1/pages/homepage.dart';
import 'package:testapp1/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    getLogInInfo();
  }

  getLogInInfo() async {
    final SharedPreferences logInInfo = await SharedPreferences.getInstance();
    // await logInInfo.clear();
    // print('All Records Cleared');
    setState(() {
      isLoggedIn = logInInfo.getBool('isLogged') ?? false;
      drkmd = logInInfo.getBool('isDarkModeEnabled') ?? false;
    });
    print('isLoggedIn' + '=' + '${isLoggedIn}');
    if (isLoggedIn == false) {
      print('Taking to register page');
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => RegisterPage()));
    } else {
      print('Taking to homePage');
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyHomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/biology_grid.png'),
          ),
        ),
      ),
    );
  }
}
