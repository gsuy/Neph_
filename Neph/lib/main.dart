import 'package:flutter/material.dart';
import 'package:neph/screen/login.dart';
import 'package:neph/screen/selectExe.dart';
import 'package:neph/screen/backend.dart';
// import 'package:neph/screen/selectday.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:neph/screen/signup2.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(myapp());
}

class myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Select(),
      home: Login(),
      // home: Signup2(),
    );
  }
}
