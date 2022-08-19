import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:testapp1/pages/homepage.dart';
import 'package:testapp1/pages/settings.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchBlood extends StatefulWidget {
  const SearchBlood({Key? key}) : super(key: key);

  @override
  _RequestBloodState createState() => _RequestBloodState();
}

class _RequestBloodState extends State<SearchBlood> {
// text fields' controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phonenumber = TextEditingController();

  final CollectionReference blood_requests =
      FirebaseFirestore.instance.collection('blood_requests');

/*
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                controller: _phonenumber,
                decoration: const InputDecoration(
                  labelText: 'Phone no',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                child: const Text('Create'),
                onPressed: () async {
                  final String name = _nameController.text;
                  final int? phone = int.tryParse(_phonenumber.text);
                  if (phone != null) {
                    await blood_requests.add({"name": name, "phone": phone});
                    CircularProgressIndicator(
                      color: Colors.black,
                      strokeWidth: 4.0,
                      value: 1.0,
                    );
                    Navigator.of(context).pop();
                    _nameController.text = '';
                    _phonenumber.text = '';
                  }
                },
              )
            ],
          ),
        );
      },
    );
  }
*/
  Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _nameController.text = documentSnapshot['name'];
      _phonenumber.text = documentSnapshot['phone'].toString();
    }

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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                controller: _phonenumber,
                decoration: const InputDecoration(
                  labelText: 'Phone No',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                child: const Text('Update'),
                onPressed: () async {
                  final String name = _nameController.text;
                  final int? phone = int.tryParse(_phonenumber.text);
                  if (phone != null) {
                    await blood_requests
                        .doc(documentSnapshot!.id)
                        .update({"name": name, "phone": phone});
                    _nameController.text = '';
                    _phonenumber.text = '';
                    Navigator.of(context).pop();
                  }
                },
              )
            ],
          ),
        );
      },
    );
  }

  Future<void> _delete(String productId) async {
    await blood_requests.doc(productId).delete();

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('You have successfully deleted a product')));
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: drkmd == true ? Colors.grey[900] : Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 50,
        elevation: 0,
        backgroundColor: HexColor('#e63946'),
        title: Text(
          'Find A Donor',
          style: TextStyle(
            fontFamily: 'SuezOne',
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: StreamBuilder(
        stream: blood_requests.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Container(
                        width: width,
                        // height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: drkmd == true
                              ? HexColor('#444444')
                              : HexColor('#dfe6e9'),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 3,
                              color: drkmd == true
                                  ? HexColor('#444444')
                                  : HexColor('#dfe6e9'),
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(5, 15, 10, 5),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: HexColor('#e63946'),
                                child: Icon(
                                  size: 40,
                                  Icons.person,
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      10.0, 10.0, 0, 5.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Name: ',
                                              style: TextStyle(
                                                color: drkmd == true
                                                    ? HexColor('#bebebe')
                                                    : HexColor('#636e72'),
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  '${documentSnapshot['name']}',
                                              style: TextStyle(
                                                color: drkmd == true
                                                    ? HexColor('#bebebe')
                                                    : HexColor('#636e72'),
                                                fontSize: 17,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Address: ',
                                              style: TextStyle(
                                                color: drkmd == true
                                                    ? HexColor('#bebebe')
                                                    : HexColor('#636e72'),
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  '${documentSnapshot['address']}',
                                              style: TextStyle(
                                                color: drkmd == true
                                                    ? HexColor('#bebebe')
                                                    : HexColor('#636e72'),
                                                fontSize: 17,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Blood: ',
                                              style: TextStyle(
                                                color: drkmd == true
                                                    ? HexColor('#bebebe')
                                                    : HexColor('#636e72'),
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  '${documentSnapshot['bloodtype']}',
                                              style: TextStyle(
                                                color: drkmd == true
                                                    ? HexColor('#e63946')
                                                    : HexColor('#e63946'),
                                                fontSize: 17,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Blood Amount: ',
                                              style: TextStyle(
                                                color: drkmd == true
                                                    ? HexColor('#bebebe')
                                                    : HexColor('#636e72'),
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  '${documentSnapshot['bloodamount']}',
                                              style: TextStyle(
                                                color: drkmd == true
                                                    ? HexColor('#e63946')
                                                    : HexColor('#e63946'),
                                                fontSize: 17,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Contact: ',
                                              style: TextStyle(
                                                color: drkmd == true
                                                    ? HexColor('#bebebe')
                                                    : HexColor('#636e72'),
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  '${documentSnapshot['phone']}',
                                              style: TextStyle(
                                                color: drkmd == true
                                                    ? HexColor('#bebebe')
                                                    : HexColor('#636e72'),
                                                fontSize: 17,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        launch(
                                            "tel://${documentSnapshot['phone']}");
                                      },
                                      // color: HexColor('#e63946'),
                                      style: TextButton.styleFrom(
                                        backgroundColor: HexColor('#e63946'),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.call,
                                        color: Colors.white,
                                      ),
                                    ),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor: HexColor('#e63946'),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                      onPressed: () =>
                                          _update(documentSnapshot),
                                      child: const Text(
                                        "U",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontFamily: 'Nunito',
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor: HexColor('#e63946'),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                      onPressed: () =>
                                          _delete(documentSnapshot.id),
                                      child: const Text(
                                        "D",
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
                            ],
                          ),
                        ),
                      ),
                    ),
                    /*ListTile(
                      title: Text(
                        'Name: ${documentSnapshot['name']}',
                      ),
                      subtitle: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Phone: ${documentSnapshot['phone']}\n',
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text:
                                  'Address: ${documentSnapshot['address']}\n',
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text:
                                  'BloodType: ${documentSnapshot['bloodtype']}\n',
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () => _update(documentSnapshot)),
                            IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () =>
                                    _delete(documentSnapshot.id)),
                          ],
                        ),
                      ),
                    ),*/
                  ],
                );
              },
            );
          }

          if (streamSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Text('Connect to Internet'),
            );
          }
          if (streamSnapshot.connectionState == ConnectionState.none) {
            return const Center(
              child: Text('Connect to Internet'),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
// Add new product
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => _create(),
      //   child: const Icon(Icons.add),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
