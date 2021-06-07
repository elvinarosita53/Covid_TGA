import 'package:flutter/material.dart';
import 'package:menu_login/page/page_login.dart';
import 'package:menu_login/page/page_dashboard.dart';

import 'package:menu_login/page/page_formInput.dart';

class TemplateInstansi extends StatelessWidget {
  final Widget body;
  const TemplateInstansi({this.body});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_circle),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PageFormInput(
                listID: "",
              ),
            ),
          );
        },
      ),
      appBar: AppBar(
        title: Text("Nama Instansi Kesehatan"),
        actions: [
          PopupMenuButton(
            icon: Icon(
              Icons.more_vert,
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
      ),
      backgroundColor: Colors.white,
      body: body,
    );
  }
}
