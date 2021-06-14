import 'package:flutter/material.dart';
import 'package:menu_login/example/page_admin.dart';
import 'package:menu_login/example/page_instansi.dart';
import 'package:menu_login/page/page_dashboard.dart';
import 'package:menu_login/page/page_listAdmin.dart';
import 'package:menu_login/example/page_listInstansi.dart';
import 'package:menu_login/page/page_panduan.dart';
import 'package:menu_login/page/page_tabel.dart';
import 'package:menu_login/widget/constant.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int klik = 0;
  bool isAdmin = true;

  @override
  Widget build(BuildContext context) {
    List pageTujuan = (isAdmin)
        ? [
            PagePanduan(),
            PageDashboard(),
            PageTabel(),
            PageListAdmin(),
          ]
        : [PageInstansi(), PageListInstansi()];

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red,
        selectedLabelStyle: TextStyle(
          color: Colors.black,
          // backgroundColor: Colors.red,
          decorationColor: Colors.green,
          fontSize: 8,
        ),
        unselectedLabelStyle: TextStyle(
          color: Colors.black,
          // backgroundColor: Colors.red,
          decorationColor: Colors.green,
          fontSize: 8,
        ),
        currentIndex: klik,
        onTap: (value) {
          klik = value;
          setState(() {});
        },
        //menghilangkan lebel
        showSelectedLabels: true,
        showUnselectedLabels: true,

        items: [
          BottomNavigationBarItem(
            label: "FAQ",
            icon: Icon(
              Icons.question_answer,
              color: primarycolor,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
              color: primarycolor,
            ),
            label: "Beranda",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list,
              color: primarycolor,
            ),
            label: "List",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: primarycolor,
            ),
            label: "Dashboard",
          ),
        ],
      ),
      body: pageTujuan[klik],
    );
  }
}
