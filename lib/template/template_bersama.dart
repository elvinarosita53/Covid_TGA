import 'package:flutter/material.dart';
import 'package:menu_login/page/page_login.dart';
import 'package:menu_login/page/page_dashboard.dart';
import 'package:menu_login/widget/constant.dart';

class TemplateBersama extends StatelessWidget {
  final String namaAppbar;
  final Widget body;
  final Widget floatingActionButton;
  final Widget child;

  const TemplateBersama(
      {@required this.namaAppbar,
      this.body,
      this.floatingActionButton,
      this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        floatingActionButton: floatingActionButton,
        body: NestedScrollView(
          body: body,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              floating: true,
              pinned: true,
              snap: true,
              backgroundColor: primarycolor,
              title: Text(
                namaAppbar,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
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
                    child: child,
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
