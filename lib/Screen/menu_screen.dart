import 'package:flutter/material.dart';
import 'package:flutter_firebase_database/Screen/read_screen.dart';
import 'create_screen.dart';
import 'package:firebase_database/firebase_database.dart';

class Menu extends StatelessWidget {
  final databaseReference = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase example'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 60,
              child: OutlinedButton.icon(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Create()));
                },
                icon: Icon(Icons.add),
                label: Text('Add Record'),
                style: OutlinedButton.styleFrom(
                    alignment: Alignment.centerLeft,
                    side: BorderSide(color: Colors.purple.shade200)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: OutlinedButton.icon(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Read()));
                },
                icon: Icon(Icons.show_chart),
                label: Text('Show Record'),
                style: OutlinedButton.styleFrom(
                    alignment: Alignment.centerLeft,
                    side: BorderSide(color: Colors.purple.shade200)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
