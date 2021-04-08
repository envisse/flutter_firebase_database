import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Create(),
      theme: ThemeData(
        colorScheme: ColorScheme.dark(),
        //accent color untuk merubah hover highlight dari textfield
        // accentColor: Colors.amber,
      ),
    );
  }
}

class Create extends StatefulWidget {
  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
 
  @override
  Widget build(BuildContext context) {
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
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.location_on),
                  labelText: 'Location',
                  hintText: 'Input location',
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    print('hello world');
                  },
                  child: Text('SUBMIT')),
            )
          ],
        )),
      ),
    );
  }
}


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
