import 'package:flutter/material.dart';
import 'package:menu_login/page/page_login.dart';
import 'package:menu_login/page/page_dashboard.dart';
import 'package:menu_login/page/page_formInput.dart';

class TemplateAdmin extends StatelessWidget {
  final Widget body;

  const TemplateAdmin({this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_circle),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PageFormInput(),
            ),
          );
        },
      ),
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
    );
  }
}
