import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:menu_login/example/page_admin.dart';
import 'package:menu_login/example/page_instansi.dart';
import 'package:menu_login/page/page_dashboard.dart';
import 'package:menu_login/page/page_listAdmin.dart';
import 'package:menu_login/example/page_listInstansi.dart';
import 'package:menu_login/page/page_panduan.dart';
import 'package:menu_login/page/page_tabel.dart';
import 'package:menu_login/widget/constant.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  int klik = 0;
  bool isAdmin = true;

  @override
  Widget build(BuildContext context) {
    List pageTujuan = [
      PagePanduan(),
      PageDashboard(),
      PageTabel(),
      PageListAdmin(),
    ];

    return Scaffold(
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: klik,
        onTap: (value) {
          setState(() {
            klik = value;
          });
        },
        //menghilangkan lebel
        // showSelectedLabels: true,
        // showUnselectedLabels: false,

        items: (auth.currentUser != null)
            ? [
                //icon FAQ
                SalomonBottomBarItem(
                  icon: Icon(Icons.question_answer),
                  title: Text("Panduan"),
                  selectedColor: primarycolor,
                ),
                //icon Home
                SalomonBottomBarItem(
                  icon: Icon(Icons.home),
                  title: Text("Beranda"),
                  selectedColor: primarycolor,
                ),

                SalomonBottomBarItem(
                  icon: Icon(Icons.list),
                  title: Text("Daftar"),
                  selectedColor: primarycolor,
                ),
                SalomonBottomBarItem(
                  icon: Icon(Icons.person),
                  title: Text("Person"),
                  selectedColor: primarycolor,
                ),
              ]
            : [
                //icon FAQ
                SalomonBottomBarItem(
                  icon: Icon(Icons.question_answer),
                  title: Text("Panduan"),
                  selectedColor: primarycolor,
                ),
                //icon Home
                SalomonBottomBarItem(
                  icon: Icon(Icons.home),
                  title: Text("Beranda"),
                  selectedColor: primarycolor,
                ),

                SalomonBottomBarItem(
                  icon: Icon(Icons.list),
                  title: Text("Daftar"),
                  selectedColor: primarycolor,
                ),
              ],
      ),
      body: pageTujuan[klik],
    );
  }
}
