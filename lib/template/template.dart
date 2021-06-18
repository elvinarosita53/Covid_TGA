import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menu_login/main_page.dart';
import 'package:menu_login/page/page_dashboard.dart';

import 'package:menu_login/page/page_login.dart';
import 'package:menu_login/widget/constant.dart';

class Template extends StatefulWidget {
  final Widget body;

  Template({this.body});

  @override
  _TemplateState createState() => _TemplateState();
}

class _TemplateState extends State<Template> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          "Statistics",
          style: GoogleFonts.oswald(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor: primarycolor,

        actions: [
          PopupMenuButton(
            icon: Icon(
              Icons.menu,
              size: 30,
              color: Colors.white,
            ),
            onSelected: (value) async {
              if (value == "Login") {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PageLogin();
                    },
                  ),
                );
              } else if (value == "Log Out") {
                await auth.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MainPage();
                    },
                  ),
                );
              }
              setState(() {});
            },
            itemBuilder: (context) => (auth.currentUser != null)
                ? [
                    PopupMenuItem(
                      child: Text("Log Out"),
                      value: "Log Out",
                    )
                  ]
                : [
                    PopupMenuItem(
                      child: Text("Login"),
                      value: "Login",
                    )
                  ],
          )
        ],
        elevation: 0,
        // leading: IconButton(icon: men, onPressed: onPressed),
      ),
      body: widget.body,
    );
  }
}
