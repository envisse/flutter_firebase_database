import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_firebase_database/model/person.dart';

class Read extends StatefulWidget {
  Read({Key key}) : super(key: key);

  @override
  _ReadState createState() => _ReadState();
}

class _ReadState extends State<Read> {
  List listdatabase = [];

  final databasereference =
      FirebaseDatabase.instance.reference().child('person');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Read Firebase'),
      ),
      body: FutureBuilder(
        future: Person.getpersons(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Container(
              child: Center(
                child: Text('Loading...'),
              ),
            );
          }
          // else if (snapshot.hasData) {
          //   listdatabase.clear();
          //   Map<dynamic, dynamic> values = snapshot.data.value;
          //   values.forEach((key, values) {
          //     listdatabase.add(values);
          //   });
          // }
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(snapshot.data[index].phone),
                // subtitle: Text(listdatabase[index]['address']),
                // trailing: Text(
                //     '${listdatabase[index]['phone']} + ${listdatabase[index]['person']}'),
                // onTap: () {
                //   Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) =>
                //               Singledata(listdatabase[index])));
                // },
              );
            },
          );
        },
      ),
    );
  }
}

class Singledata extends StatelessWidget {
  final String index;
  List listdatabase = [];
  Singledata(this.index);
  @override
  Widget build(BuildContext context) {
    final databasereference = FirebaseDatabase.instance
        .reference()
        .child('person')
        .orderByKey()
        .equalTo(index)
        .once();

    return Scaffold(
      appBar: AppBar(
        title: Text('hello world'),
      ),
    );
  }
}
