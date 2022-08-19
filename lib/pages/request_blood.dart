import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:testapp1/lists/dropdown_requestblood.dart';

class RequestBlood extends StatefulWidget {
  const RequestBlood({Key? key}) : super(key: key);

  @override
  RequestBloodState createState() => RequestBloodState();
}

class RequestBloodState extends State<RequestBlood> {
// text fields' controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phonenumber = TextEditingController();
  final TextEditingController _address = TextEditingController();
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
        title: const Center(child: Text('Request Blood')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 5.0),
                ),
                labelText: 'Name',
                prefixIcon: Icon(Icons.people),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextField(
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              controller: _phonenumber,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 5.0),
                  ),
                  labelText: 'Phone no',
                  prefixIcon: Icon(Icons.phone_android)),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              controller: _address,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 5.0),
                ),
                labelText: 'Address',
                prefixIcon: Icon(Icons.location_on),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomDropdownButton(
              defaultValue: defaultValue,
              values: selectedItemValue,
              onItemSelected: (value) {
                print("Selected Item : $value");
              },
            ),
            /*
            DropdownButton<String>(
              items: <String>['A+', 'A-', 'AB+', 'AB-', 'B+', 'B-', 'O+', 'O-']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              value: dropdownValue,
              icon: const Icon(
                Icons.arrow_downward,
              ),
              elevation: 16,
              style: const TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              underline: Container(
                height: 2,
                color: Colors.grey[600],
              ),
              onChanged: (String? newValue) {
                setState(
                  () {
                    dropdownValue = newValue!;
                  },
                );
              },
            ),
            */
            ElevatedButton(
              child: const Text('Request'),
              onPressed: () async {
                final String name = _nameController.text;
                final int? phone = int.tryParse(_phonenumber.text);
                final String address = _address.text;
                // final String bloodtype = ;
                // print('selectedItemValue = ${bloodtype}');
                if (phone != null && name != '' && address != '') {
                  await blood_requests
                      .add({"name": name, "phone": phone, "address": address});
                  Navigator.of(context).pop();
                  _nameController.text = '';
                  _phonenumber.text = '';
                  _address.text = '';
                } else if (phone == null || name == '' || address == '') {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please enter all the required details'),
                    ),
                  );
                }
              },
            ),
          ],
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
