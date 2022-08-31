import 'package:phoenix_native/phoenix_native.dart';
import 'package:testapp1/allpages.dart';
import 'package:testapp1/pages/homepage.dart';
import 'package:testapp1/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogOut extends StatefulWidget {
  @override
  _LogOutState createState() => _LogOutState();
}

class _LogOutState extends State<LogOut> {
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    getLogInInfo();
    Future.delayed(const Duration(milliseconds: 300), () {
      print('Taking to register page');
      PhoenixNative.restartApp();
    });
  }

  getLogInInfo() async {
    final SharedPreferences logInInfo = await SharedPreferences.getInstance();
    logInInfo.setBool('isLogged', false);
    // print('All Records Cleared');
    setState(() {
      isLoggedIn = false;
      drkmd = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
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
                        CircularProgressIndicator(),
                        Text(
                          'Logging You Out...',
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w900,
                          ),
                        )
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
