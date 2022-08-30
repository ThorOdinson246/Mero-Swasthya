import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:testapp1/pages/homepage.dart';
import 'package:testapp1/pages/register_page_2.dart';

class GoogleButton extends StatelessWidget {
  GoogleButton({Key? key}) : super(key: key);

  Future<void> _googleSignIn(context) async {
    final googleSignIn = GoogleSignIn();
    final googleAccount = await googleSignIn.signIn();

    if (googleAccount != null) {
      final googleAuth = await googleAccount.authentication;
      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        final authResult = await authInstance.signInWithCredential(
          GoogleAuthProvider.credential(
              idToken: googleAuth.idToken, accessToken: googleAuth.accessToken),
        );

        if (authResult.additionalUserInfo!.isNewUser) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const RegisterPageTwo(),
            ),
          );
        } else {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const MyHomePage(),
            ),
          );
        }
      }
    }
  }

  final FirebaseAuth authInstance = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.yellow[800],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      // textColor: Colors.black,

      // splashColor: Colors.red[700],
      child: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image(image: AssetImage('images/google.png')),
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Text(
                  ' Sign In With Google  ',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Nunito',
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      onPressed: () {
        _googleSignIn(context);
      },
    );
  }
}

class GlobalMethods {
  static navigateTo({required BuildContext ctx, required String routeName}) {
    Navigator.pushNamed(ctx, routeName);
  }

  static Future<void> warningDialog({
    required String title,
    required String subtitle,
    required Function fct,
    required BuildContext context,
  }) async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Row(children: [
              Image.asset(
                'assets/images/warning-sign.png',
                height: 20,
                width: 20,
                fit: BoxFit.fill,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(title),
            ]),
            content: Text(subtitle),
            actions: [
              TextButton(
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  'Cancel',
                ),
              ),
              TextButton(
                onPressed: () {
                  fct();
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  'OK',
                ),
              ),
            ],
          );
        });
  }

  static Future<void> errorDialog({
    required String subtitle,
    required BuildContext context,
  }) async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Row(children: [
              Image.asset(
                'assets/images/warning-sign.png',
                height: 20,
                width: 20,
                fit: BoxFit.fill,
              ),
              const SizedBox(
                width: 8,
              ),
              const Text('An Error occured'),
            ]),
            content: Text(subtitle),
            actions: [
              TextButton(
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  'Ok',
                ),
              ),
            ],
          );
        });
  }
}
