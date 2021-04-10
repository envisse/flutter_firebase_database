import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Screen/menu_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Menu(),
      theme: ThemeData(
        colorScheme: ColorScheme.dark(),
        //accent color untuk merubah hover highlight dari textfield
        // accentColor: Colors.amber,
      ),
    );
  }
}

// class Read extends StatefulWidget {
//   @override
//   _ReadState createState() => _ReadState();
// }

// class _ReadState extends State<Read> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Read Firebase'),
//       ),
//       body: Container(
//           margin: EdgeInsets.symmetric(horizontal: 20), child: FutureBuilder(future: ,builder: (context,snapshot){},)),
//     );
//   }
// }



// idea untuk pembuatan future builder
// class Read extends StatelessWidget {
//   final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: FutureBuilder(
//         future: _fbApp,
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             print('you have an error ${snapshot.error.toString()}');
//             return Text('Something went wrong');
//           } else if (snapshot.hasData) {
//             return Text('My Amazing counter app');
//           } else {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
