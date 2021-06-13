import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:menu_login/page/page_dashboard.dart';
import 'package:menu_login/page/page_login.dart';
import 'package:menu_login/widget/constant.dart';

class PagePanduan extends StatelessWidget {
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
                            warnaPanduan: perItem['warna'],
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

class InfoPanduan extends StatelessWidget {
  final Color warnaPanduan;
  final String judulPanduan;

  InfoPanduan({@required this.warnaPanduan, @required this.judulPanduan});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      elevation: 4,
      child: Container(
        child: Text(judulPanduan),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: warnaPanduan,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
