import 'package:flutter/material.dart';
import 'package:menu_login/page/page_login.dart';
import 'package:menu_login/page/page_dashboard.dart';

class TemplateAdmin extends StatelessWidget {
  final Widget body;
  final Widget floatingActionButton;

  const TemplateAdmin({this.body, this.floatingActionButton});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: Text("Admin",
            style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold)),
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
        elevation: 0,
        // leading: IconButton(icon: men, onPressed: onPressed),
      ),
      body: body,
      floatingActionButton: floatingActionButton,
    );
  }
}
