import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
        });
  }

  Future<void> _delete(String productId) async {
    await blood_requests.doc(productId).delete();

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('You have successfully deleted a product')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Search Blood')),
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
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
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
                            text: 'Address: ${documentSnapshot['address']}\n',
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
                              onPressed: () => _delete(documentSnapshot.id)),
                        ],
                      ),
                    ),
                  ),
                );
              },
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
