import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:menu_login/page/page_getStart.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); //add this line code
  await Firebase.initializeApp(); //add this line code
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GetStart(),
      debugShowCheckedModeBanner: false,
    );
  }
}
