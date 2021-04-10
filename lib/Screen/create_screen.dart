import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

//Create statement using CLOUD FIRESTORE as database
class Create extends StatefulWidget {
  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
  //input form field initializing
  final textfieldname = TextEditingController();
  final textfieldaddress = TextEditingController();
  final textfieldphone = TextEditingController();
  int counterperson = 2;


  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('users');
    final tt = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Create'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: (Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Fill This Form',
              style: tt.headline4
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: 'Name',
                  hintText: 'Input name',
                  border: OutlineInputBorder()),
              controller: textfieldname,
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone),
                  labelText: 'Phone',
                  hintText: 'Input phone number',
                  border: OutlineInputBorder()),
              controller: textfieldphone,
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.location_on),
                  labelText: 'Address',
                  hintText: 'Input Address',
                  border: OutlineInputBorder()),
              controller: textfieldaddress,
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    //add data here (FIREBASE FIRESTORE)
                    users.add({
                      'name': textfieldname.text,
                      'address': textfieldaddress.text,
                      'phone': int.tryParse(textfieldphone.text) ?? 0
                    });
                    textfieldaddress.text = '';
                    textfieldname.text = '';
                    textfieldphone.text = '';
                  },
                  child: Text('SUBMIT')),
            )
          ],
        )),
      ),
    );
  }
}
