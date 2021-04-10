import 'package:firebase_database/firebase_database.dart';

class Person {
  String name, address, phone;

  Person({this.name, this.address, this.phone});

  factory Person.createUsers(Map<dynamic, dynamic> object) {
    return Person(
      phone: object['phone'],
      name: object['name'],
      address: object['address'],
    );
  }

  static Future<List> getpersons() async {
    List users = [];
    final databaseReference =
        FirebaseDatabase.instance.reference().child('person');

    databaseReference.once().then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> values = snapshot.value;
      values.forEach((key, value) {
        users.add(values);
      });
    });
    return users;
  }
}
