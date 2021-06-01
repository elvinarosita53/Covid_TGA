import 'package:flutter/material.dart';
import 'package:menu_login/page/page_admin.dart';
import 'package:menu_login/page/page_instansi.dart';
import 'package:menu_login/page/page_listAdmin.dart';
import 'package:menu_login/page/page_listInstansi.dart';

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
        ? [PageAdmin(), PageListAdmin()]
        : [PageInstansi(), PageListInstansi()];

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: klik,
        onTap: (value) {
          klik = value;
          setState(() {});
        },
        //menghilangkan lebel
        // showSelectedLabels: false,
        // showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            label: "home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "list",
          ),
        ],
      ),
      body: pageTujuan[klik],
    );
  }
}
