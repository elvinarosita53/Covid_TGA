import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:menu_login/page/page_dashboard.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); //add this line code
  await Firebase.initializeApp(); //add this line code
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //untuk setting waktu zona di indonesia
      //cara lain
      //initializeDateFormat();
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('id'), // Indonesia, no country code
      ],
      home: PageDashboard(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.loraTextTheme()),
    );
  }
}
