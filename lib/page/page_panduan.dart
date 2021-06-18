import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:menu_login/main_page.dart';
import 'package:menu_login/page/page_dashboard.dart';
import 'package:menu_login/page/page_login.dart';
import 'package:menu_login/widget/constant.dart';
import 'package:menu_login/widget/infoPanduan.dart';

class PagePanduan extends StatefulWidget {
  @override
  _PagePanduanState createState() => _PagePanduanState();
}

class _PagePanduanState extends State<PagePanduan> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: primarycolor,
        title: Text(
          "Panduan Covid-19",
          style: TextStyle(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
        ),
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
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              judulPanduan,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
              textAlign: TextAlign.center,
            ),
            height: 300,
            width: 400,
            decoration: BoxDecoration(
              color: primarycolor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(70),
                  bottomRight: Radius.circular(70)),
            ),
          ),
          Card(
            elevation: 4,
            margin: EdgeInsets.only(
              top: 100,
              left: 20,
              right: 20,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              height: double.maxFinite,
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: dataPanduan
                        .map(
                          (perItem) => InfoPanduan(
                            judulPanduan: perItem['kasus'],
                          ),
                        )
                        .toList()),
              ),
            ),
          )
        ],
      ),
    );
  }
}
