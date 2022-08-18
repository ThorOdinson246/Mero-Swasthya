import 'package:testapp1/pages/faq.dart';
import 'package:testapp1/pages/homepage.dart';
import 'package:testapp1/pages/settings.dart';
import 'package:testapp1/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  void initState() {
    super.initState();
    get();
  }

  String fullname = 'User';
  clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    print('All Records Cleared');
  }

  get() async {
    final SharedPreferences shrdpref = await SharedPreferences.getInstance();
    String flname = shrdpref.getString('nm')! +
        " " +
        shrdpref.getString('lstnm').toString();

    setState(() {
      fullname = flname;
    });
  }

  @override
  Widget build(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: drkmd == true ? Colors.grey[900] : Colors.grey[100],
      title: Text(
        "Contact Us",
        style: TextStyle(
          fontFamily: 'Nunito',
          fontWeight: FontWeight.w800,
          color: drkmd == true ? HexColor('#bebebe') : Colors.grey[800],
        ),
      ),
      content: Text(
        "Hello there, If you want to contact us under any circumstamces you may mail us at mukeshpoudel246@gmail.com or anywebany@gmail.com .",
        style: TextStyle(
          fontFamily: 'Nunito',
          fontWeight: FontWeight.w700,
          color: drkmd == true ? HexColor('#bebebe') : Colors.grey[800],
        ),
      ),
      actions: [
        okButton,
      ],
    );

    // show the dialog

    return Drawer(
      elevation: 10,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: drkmd == true ? Colors.grey[900] : Colors.grey[50],
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://rhs.sd38.bc.ca/sites/rhs.sd38.bc.ca/files/resize/Science-400x273.png'),
                  fit: BoxFit.cover,
                ),
              ),
              accountName: Text(
                fullname.isEmpty == true ? 'User' : fullname,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 19,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                radius: 21,
                backgroundColor: Colors.black,
                child: CircleAvatar(
                  radius: 33,
                  backgroundColor: Colors.blue[600],
                  child: Text(
                    fullname.substring(0, 1).toUpperCase(),
                    style: TextStyle(color: Colors.orange, fontSize: 40),
                  ),
                ),
              ),
              accountEmail: Text(''),
              /*otherAccountsPictures: [
                CircleAvatar(
                  radius: 26,
                  backgroundColor: Colors.yellow[900],
                  child: Text(
                    "P",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
                CircleAvatar(
                  radius: 26,
                  backgroundColor: Colors.yellow[900],
                  child: Text(
                    "M",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
                CircleAvatar(
                  radius: 26,
                  backgroundColor: Colors.yellow[900],
                  child: Text(
                    "S",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ],*/
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              title: Text("Home",
                  style: TextStyle(
                    color:
                        drkmd == true ? HexColor('#bebebe') : Colors.grey[800],
                  )),
              leading: Icon(
                Icons.home,
                color: Colors.yellow[900],
              ),
            ),
            // ListTile(
            //   onTap: () {},
            //   title: Text("Cart(Your Orders)",
            //       style: TextStyle(
            //         color:
            //             drkmd == true ? HexColor('#bebebe') : Colors.grey[800],
            //       )),
            //   leading: Icon(
            //     Icons.shopping_cart,
            //     color: Colors.yellow[900],
            //   ),
            // ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              title: Text(
                "Settings",
                style: TextStyle(
                  color: drkmd == true ? HexColor('#bebebe') : Colors.grey[800],
                ),
              ),
              leading: Icon(
                Icons.settings,
                color: Colors.yellow[900],
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              title: Text("About us",
                  style: TextStyle(
                    color:
                        drkmd == true ? HexColor('#bebebe') : Colors.grey[800],
                  )),
              leading: Icon(
                Icons.info,
                color: Colors.yellow[900],
              ),
            ),
            ListTile(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return alert;
                  },
                );
              },
              title: Text("Contact us",
                  style: TextStyle(
                    color:
                        drkmd == true ? HexColor('#bebebe') : Colors.grey[800],
                  )),
              leading: Icon(
                Icons.contact_mail,
                color: Colors.yellow[900],
              ),
            ),
            ListTile(
              onTap: () {
                // clear();
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => FAQs()));
              },
              title: Text("FAQs",
                  style: TextStyle(
                    color:
                        drkmd == true ? HexColor('#bebebe') : Colors.grey[800],
                  )),
              leading: Icon(
                Icons.question_answer,
                color: Colors.yellow[900],
              ),
            ),
            Divider(
              thickness: 5,
              color: Colors.yellow[900],
            ),
            ListTile(
              onTap: () {
                clear();
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Splash()));
              },
              title: Text("Log out",
                  style: TextStyle(
                    color:
                        drkmd == true ? HexColor('#bebebe') : Colors.grey[800],
                  )),
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.yellow[900],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
