import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:menu_login/main_page.dart';
import 'package:menu_login/page/page_login.dart';
import 'package:menu_login/page/page_dashboard.dart';
import 'package:menu_login/widget/constant.dart';

class TemplateBersama extends StatefulWidget {
  final String namaAppbar;
  final Widget body;
  final Widget floatingActionButton;
  final Widget child;

  TemplateBersama(
      {@required this.namaAppbar,
      this.body,
      this.floatingActionButton,
      this.child});

  @override
  _TemplateBersamaState createState() => _TemplateBersamaState();
}

class _TemplateBersamaState extends State<TemplateBersama> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        floatingActionButton: widget.floatingActionButton,
        body: NestedScrollView(
          body: widget.body,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              floating: true,
              pinned: true,
              snap: true,
              backgroundColor: primarycolor,
              title: Text(
                widget.namaAppbar,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
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
              bottom: PreferredSize(
                child: Container(
                  color: Colors.white,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      color: primarycolor,
                    ),
                    height: 80,
                    child: widget.child,
                  ),
                ),
                preferredSize: Size.fromHeight(80),
              ),
              elevation: 0,
            )
          ],
        ));
  }
}
