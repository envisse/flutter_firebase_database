import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Read extends StatefulWidget {
  Read({Key key}) : super(key: key);

  @override
  _ReadState createState() => _ReadState();
}

class _ReadState extends State<Read> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference users = firestore.collection('users');
    return Scaffold(
      appBar: AppBar(
        title: Text('Read Firebase'),
      ),
      body:
          //note : 1x
          //     FutureBuilder<QuerySnapshot>(
          //   future: users.get(),
          //   builder: (_, snapshot) {
          //     if (snapshot.hasData) {
          //       return Column(
          //         children: snapshot.data.docs
          //             .map((e) => Column(
          //                   children: [
          //                     ListTile(
          //                       title: Text(e.data()['name']),
          //                       subtitle: Text(e.data()['address']),
          //                       trailing: Text(e.data()['phone'].toString()),
          //                     ),
          //                     SizedBox(
          //                       height: 5,
          //                     )
          //                   ],
          //                 ))
          //             .toList(),
          //       );
          //     } else {
          //       return Text('Loading');
          //     }
          //   },
          // ),

          //note : synced
          StreamBuilder<QuerySnapshot>(
        stream: users.snapshots(),
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: snapshot.data.docs
                  .map((e) => Column(
                        children: [
                          ListTile(
                              title: Text(e.data()['name']),
                              subtitle: Text(e.data()['address']),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                      icon: Icon(
                                        Icons.edit,
                                        color: Colors.cyan.shade200,
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Update(
                                                      //mengambil id
                                                      id: e.id,
                                                    )));
                                      }),
                                  IconButton(
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.red.shade400,
                                      ),
                                      onPressed: () {
                                        users.doc(e.id).delete();
                                      }),
                                ],
                              )),
                          SizedBox(
                            height: 5,
                          )
                        ],
                      ))
                  .toList(),
            );
          } else {
            return Text('Loading');
          }
        },
      ),
    );
  }
}

class Update extends StatefulWidget {
  final String id;

  const Update({Key key, this.id}) : super(key: key);
  @override
  _UpdateState createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  final textfieldname = TextEditingController();
  final textfieldaddress = TextEditingController();
  final textfieldphone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    DocumentReference user =
        firestore.collection('users').doc(widget.id.toString());
    final tt = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text('ID: ${widget.id}'),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: user.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var userDocument = snapshot.data;
            textfieldname.text = userDocument['name'].toString();
            textfieldaddress.text = userDocument['address'].toString();
            textfieldphone.text = userDocument['phone'].toString();
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: (Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Update',
                    style: tt.headline4.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.white),
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
                          user.update({
                            'address': textfieldaddress.text,
                            'name': textfieldname.text,
                            'phone': int.tryParse(textfieldphone.text) ?? 0,
                          });
                          Navigator.pop(context);
                        },
                        child: Text('UPDATE')),
                  )
                ],
              )),
            );
          } else {
            return Center(
              child: Text('Loading.....'),
            );
          }
        },
      ),
    );
  }
}
