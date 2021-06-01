import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:menu_login/page/page_dashboard.dart';
import 'package:menu_login/page/page_formInput.dart';
import 'package:menu_login/page/page_getStart.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); //add this line code
  await Firebase.initializeApp(); //add this line code
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('id'), // Indonesia, no country code
      ],
      home: PageFormInput(),
      debugShowCheckedModeBanner: false,
    );
  }
}
