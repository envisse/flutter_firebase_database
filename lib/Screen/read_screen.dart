import 'package:flutter/material.dart';

class Read extends StatefulWidget {
  Read({Key key}) : super(key: key);

  @override
  _ReadState createState() => _ReadState();
}

class _ReadState extends State<Read> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Read Firebase'),
      ),
      body: FutureBuilder(),
    );
  }
}
