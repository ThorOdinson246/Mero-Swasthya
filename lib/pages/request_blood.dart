import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:testapp1/lists/dropdown_requestblood.dart';
import 'package:testapp1/pages/homepage.dart';
import 'package:testapp1/pages/settings.dart';

class RequestBlood extends StatefulWidget {
  const RequestBlood({Key? key}) : super(key: key);

  @override
  RequestBloodState createState() => RequestBloodState();
}

String? bloodtype;

class RequestBloodState extends State<RequestBlood> {
// text fields' controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phonenumber = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _bloodamount = TextEditingController();

  // final TextEditingController _address = TextEditingController();
  //Blood Type
  //Location

  final CollectionReference blood_requests =
      FirebaseFirestore.instance.collection('blood_requests');

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

/*
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
        });
  }
*/
/*
  Future<void> _delete(String productId) async {
    await blood_requests.doc(productId).delete();

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('You have successfully deleted a product')));
  }
*/
  @override
  Widget build(BuildContext context) {
    const defaultValue = 'A+';

    late String? dropdownValue = 'A+';

    List<String> selectedItemValue = <String>[
      'A+',
      'A-',
      'B+',
      'B-',
      'AB+',
      'AB-',
      'O+',
      'O-'
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 50,
        elevation: 0,
        backgroundColor: HexColor('#0984e3'),
        title: Text(
          'Request Blood',
          style: TextStyle(
            fontFamily: 'SuezOne',
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: drkmd == true ? Colors.grey[900] : Colors.grey[100],
      body: SingleChildScrollView(
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
                const SizedBox(
                  height: 20.0,
                ),
                TextField(
                  style: TextStyle(
                    color: drkmd == true ? Colors.white : Colors.grey[600],
                  ),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  controller: _phonenumber,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(40),
                        right: Radius.circular(40),
                      ),
                      borderSide: BorderSide(color: Colors.red, width: 5.0),
                    ),
                    labelText: 'Phone no',
                    labelStyle: TextStyle(
                      color: drkmd == true ? Colors.white : Colors.grey[600],
                    ),
                    prefixIcon: Icon(
                      Icons.phone_android,
                      color: drkmd == true ? Colors.white : Colors.grey[600],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  style: TextStyle(
                    color: drkmd == true ? Colors.white : Colors.grey[600],
                  ),
                  controller: _address,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(40),
                        right: Radius.circular(40),
                      ),
                      borderSide: BorderSide(color: Colors.red, width: 5.0),
                    ),
                    labelText: 'Address',
                    labelStyle: TextStyle(
                      color: drkmd == true ? Colors.white : Colors.grey[600],
                    ),
                    prefixIcon: Icon(
                      Icons.location_on,
                      color: drkmd == true ? Colors.white : Colors.grey[600],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  style: TextStyle(
                    color: drkmd == true ? Colors.white : Colors.grey[600],
                  ),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  controller: _bloodamount,
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
                    labelText: 'Amount',
                    labelStyle: TextStyle(
                      color: drkmd == true ? Colors.white : Colors.grey[600],
                    ),
                    prefixIcon: Icon(
                      Icons.bloodtype_outlined,
                      color: drkmd == true ? Colors.white : Colors.grey[600],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(40),
                        right: Radius.circular(40),
                      ),
                      borderSide: BorderSide(color: Colors.red, width: 5.0),
                    ),
                    labelText: 'Blood Type',
                    prefixIcon: Icon(
                      Icons.bloodtype,
                      color: drkmd == true ? Colors.white : Colors.grey[600],
                    ),
                  ),
                  value: dropdownValue,
                  dropdownColor:
                      drkmd == true ? Colors.grey[600] : Colors.white,
                  items: selectedItemValue.map((dropValue) {
                    return DropdownMenuItem<String>(
                      value: dropValue,
                      child: Text(
                        dropValue,
                        style: TextStyle(
                          color:
                              drkmd == true ? Colors.white : Colors.grey[600],
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (newDropdownValue) {
                    setState(() {
                      bloodtype = dropdownValue = newDropdownValue!;
                      // bloodtype = dropdownValue;
                    });
                    print('$dropdownValue$bloodtype');
                    // widget.onItemSelected(newDropdownValue);
                  },
                ),
                const SizedBox(
                  height: 20,
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
                    final int? phone = int.tryParse(_phonenumber.text);
                    final String address = _address.text;
                    final String? blood = bloodtype;
                    final int? bloodamount = int.tryParse(_bloodamount.text);
                    // print('selectedItemValue = ${bloodtype}');
                    if (phone != null && name != '' && address != '') {
                      await blood_requests.add(
                        {
                          "name": name,
                          "phone": phone,
                          "address": address,
                          "bloodtype": bloodtype,
                          "bloodamount": bloodamount
                        },
                      );
                      Navigator.of(context).pop();
                      _nameController.text = '';
                      _phonenumber.text = '';
                      _address.text = '';
                    } else if (phone == null ||
                        name == '' ||
                        address == '' ||
                        bloodamount == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter all the details'),
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
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => _create(),
      //   child: const Icon(Icons.add),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
    );
  }
}
