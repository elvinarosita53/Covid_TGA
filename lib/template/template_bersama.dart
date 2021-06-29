import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:menu_login/main_page.dart';
import 'package:menu_login/page/page_login.dart';
import 'package:menu_login/page/page_dashboard.dart';
import 'package:menu_login/widget/constant.dart';

class TemplateBersama extends StatefulWidget {
  final String namaAppbar;
  final Widget body;
  final Widget floatingActionButton;
  final Widget child;

  TemplateBersama({
    @required this.namaAppbar,
    this.body,
    this.floatingActionButton,
    this.child,
  });

  @override
  _TemplateBersamaState createState() => _TemplateBersamaState();
}

class _TemplateBersamaState extends State<TemplateBersama> {
  FirebaseAuth auth = FirebaseAuth.instance;
  CollectionReference backend =
      FirebaseFirestore.instance.collection('data_profil');

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
                overflow: TextOverflow.ellipsis,
                // maxLines: 2,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
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
                child: (auth.currentUser != null)
                    ? FutureBuilder<DocumentSnapshot>(
                        future: backend.doc(auth.currentUser.uid).get(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            print("data : ${snapshot.data}");
                            Map result = snapshot.data.data();

                            return Container(
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
                                child: (result['role'] == 'admin')
                                    ? widget.child
                                    : SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                      ),
                              ),
                            );
                          } else {
                            return loading;
                          }
                        },
                      )
                    : Container(
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
