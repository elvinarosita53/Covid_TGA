import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:menu_login/main_page.dart';
import 'package:menu_login/page/page_login.dart';
import 'package:menu_login/widget/constant.dart';

class TamplatePanduan extends StatefulWidget {
  final List<Widget> widgets;
  final Widget tittle;

  TamplatePanduan({@required this.widgets, @required this.tittle});
  @override
  _TamplatePanduanState createState() => _TamplatePanduanState();
}

class _TamplatePanduanState extends State<TamplatePanduan> {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        backgroundColor: primarycolor,
        title: widget.tittle, //
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.only(top: 40),
              height: 300,
              width: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment(1, 0.4),
                  image: AssetImage(
                    "images/bapak.png",
                  ),
                ),
                color: Colors.blueGrey[200],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(456),
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: widget.widgets,
            ),
          ),
        ],
      ),
    );
  }
}
