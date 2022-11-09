import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:testapp1/allpages.dart';
// import 'package:testapp1/lists/dropdown_easyData.dart';
import 'package:testapp1/pages/homepage.dart';
import 'package:testapp1/pages/settings.dart';

class easyData extends StatefulWidget {
  const easyData({Key? key}) : super(key: key);

  @override
  easyDataState createState() => easyDataState();
}

String? bloodtype;

class easyDataState extends State<easyData> {
// text fields' controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _details = TextEditingController();
  final TextEditingController _morelink = TextEditingController();
  final TextEditingController _symptoms = TextEditingController();
  final TextEditingController _prevention = TextEditingController();
  final TextEditingController _no = TextEditingController();
  final TextEditingController _image = TextEditingController();
  // final TextEditingController _address = TextEditingController();
  //Blood Type
  //Location

  final CollectionReference blood_requests =
      FirebaseFirestore.instance.collection('common_concerns');

  Future<void> _create([DocumentSnapshot? documentSnapshot]) async {
    await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext ctx) {
        return Padding(
          padding: EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
              bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 50,
        elevation: 0,
        backgroundColor: HexColor('#0984e3'),
        title: Text(
          'Easy Data',
          style: TextStyle(
            fontFamily: 'SuezOne',
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: drkmd == true ? Colors.grey[900] : Colors.grey[100],
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: drkmd == true ? HexColor('#444444') : HexColor('#dfe6e9'),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Easy Data Entry.\n',
                    style: TextStyle(
                        color: drkmd == true ? Colors.white : Colors.grey[600],
                        fontFamily: 'Nunito'),
                  ),
                  TextField(
                    controller: _nameController,
                    style: TextStyle(
                      color: drkmd == true ? Colors.white : Colors.grey[600],
                    ),
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(40),
                          right: Radius.circular(40),
                        ),
                        borderSide: BorderSide(color: Colors.red, width: 5.0),
                      ),
                      labelText: 'Name',
                      labelStyle: TextStyle(
                        color: drkmd == true ? Colors.white : Colors.grey[600],
                      ),
                      prefixIcon: Icon(
                        Icons.people,
                        color: drkmd == true ? Colors.white : Colors.grey[600],
                      ),
                    ),
                  ),
                  TextField(
                    controller: _image,
                    style: TextStyle(
                      color: drkmd == true ? Colors.white : Colors.grey[600],
                    ),
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(40),
                          right: Radius.circular(40),
                        ),
                        borderSide: BorderSide(color: Colors.red, width: 5.0),
                      ),
                      labelText: 'image',
                      labelStyle: TextStyle(
                        color: drkmd == true ? Colors.white : Colors.grey[600],
                      ),
                      prefixIcon: Icon(
                        Icons.people,
                        color: drkmd == true ? Colors.white : Colors.grey[600],
                      ),
                    ),
                  ),
                  TextField(
                    controller: _details,
                    style: TextStyle(
                      color: drkmd == true ? Colors.white : Colors.grey[600],
                    ),
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(40),
                          right: Radius.circular(40),
                        ),
                        borderSide: BorderSide(color: Colors.red, width: 5.0),
                      ),
                      labelText: 'details',
                      labelStyle: TextStyle(
                        color: drkmd == true ? Colors.white : Colors.grey[600],
                      ),
                      prefixIcon: Icon(
                        Icons.people,
                        color: drkmd == true ? Colors.white : Colors.grey[600],
                      ),
                    ),
                  ),
                  TextField(
                    controller: _symptoms,
                    style: TextStyle(
                      color: drkmd == true ? Colors.white : Colors.grey[600],
                    ),
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(40),
                          right: Radius.circular(40),
                        ),
                        borderSide: BorderSide(color: Colors.red, width: 5.0),
                      ),
                      labelText: 'symptoms',
                      labelStyle: TextStyle(
                        color: drkmd == true ? Colors.white : Colors.grey[600],
                      ),
                      prefixIcon: Icon(
                        Icons.people,
                        color: drkmd == true ? Colors.white : Colors.grey[600],
                      ),
                    ),
                  ),
                  TextField(
                    controller: _prevention,
                    style: TextStyle(
                      color: drkmd == true ? Colors.white : Colors.grey[600],
                    ),
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(40),
                          right: Radius.circular(40),
                        ),
                        borderSide: BorderSide(color: Colors.red, width: 5.0),
                      ),
                      labelText: 'prevention',
                      labelStyle: TextStyle(
                        color: drkmd == true ? Colors.white : Colors.grey[600],
                      ),
                      prefixIcon: Icon(
                        Icons.people,
                        color: drkmd == true ? Colors.white : Colors.grey[600],
                      ),
                    ),
                  ),
                  TextField(
                    controller: _morelink,
                    style: TextStyle(
                      color: drkmd == true ? Colors.white : Colors.grey[600],
                    ),
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(40),
                          right: Radius.circular(40),
                        ),
                        borderSide: BorderSide(color: Colors.red, width: 5.0),
                      ),
                      labelText: 'morelink',
                      labelStyle: TextStyle(
                        color: drkmd == true ? Colors.white : Colors.grey[600],
                      ),
                      prefixIcon: Icon(
                        Icons.people,
                        color: drkmd == true ? Colors.white : Colors.grey[600],
                      ),
                    ),
                  ),
                  TextField(
                    controller: _no,
                    style: TextStyle(
                      color: drkmd == true ? Colors.white : Colors.grey[600],
                    ),
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(40),
                          right: Radius.circular(40),
                        ),
                        borderSide: BorderSide(color: Colors.red, width: 5.0),
                      ),
                      labelText: 'no',
                      labelStyle: TextStyle(
                        color: drkmd == true ? Colors.white : Colors.grey[600],
                      ),
                      prefixIcon: Icon(
                        Icons.people,
                        color: drkmd == true ? Colors.white : Colors.grey[600],
                      ),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: HexColor('#0984e3'),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                        child: Text(
                          'Request',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontFamily: 'Nunito',
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      final String name = _nameController.text;
                      final String morelink = _morelink.text;
                      final String no = _no.text;
                      final String details = _details.text;
                      final String symptoms = _symptoms.text;
                      final String prevention = _prevention.text;
                      final String image = _image.text;

                      // print('selectedItemValue = ${bloodtype}');
                      if (image != null && name != '' && no != '') {
                        await blood_requests.add(
                          {
                            // "user-id": user!.uid,
                            "name": name,
                            "morelink": morelink,
                            "no": no,
                            "details": details,
                            "symptoms": symptoms,
                            "prevention": prevention,
                            "image": image,
                          },
                        );
                        Navigator.of(context).pop();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Your Data is entered.'),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => _create(),
      //   child: const Icon(Icons.add),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
    );
  }
}
