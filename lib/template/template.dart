import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menu_login/page/page_dashboard.dart';

import 'package:menu_login/page/page_login.dart';
import 'package:menu_login/widget/constant.dart';

class Template extends StatelessWidget {
  final Widget body;

  const Template({this.body});

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
            onSelected: (value) {
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PageLogin();
                    },
                  ),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PageDashboard();
                    },
                  ),
                );
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text("Login"),
                value: "Login",
              ),
              PopupMenuItem(
                child: Text("Log Out"),
                value: "Log Out",
              ),
              PopupMenuItem(
                child: Text("Menu Utama"),
                value: "Menu Utama",
              ),
            ],
          )
        ],
        elevation: 0,
        // leading: IconButton(icon: men, onPressed: onPressed),
      ),
      body: body,
    );
  }
}
