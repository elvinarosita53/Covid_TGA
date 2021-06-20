import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:menu_login/main_page.dart';
import 'package:menu_login/page/page_profil.dart';
import 'package:menu_login/page/page_resetPassword.dart';
import 'package:menu_login/widget/constant.dart';

class PageLogin extends StatefulWidget {
  final bool password;

  const PageLogin({this.password = false});

  @override
  _PageLoginState createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController contorllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // deklarasi firebase
    FirebaseFirestore emailFirebase = FirebaseFirestore.instance;

    // variabel yang nyimpan nama tabel(collaction)
    CollectionReference user_pengguna =
        emailFirebase.collection("user_pengguna");

    return Scaffold(
      // backgroundColor: Colors.blue[100],
      body: Column(
        children: [
          Container(
            height: 50,
            color: primarycolor,
          ),
          Stack(
            children: [
              Container(
                padding: EdgeInsets.only(top: 40),
                height: 300,
                width: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    scale: 0.7,
                    image: AssetImage(
                      "images/bapak.png",
                    ),
                  ),
                  color: primarycolor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(150),
                      bottomRight: Radius.circular(150)),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: primarycolor,
                  ),
                  child: TextField(
                    controller: contorllerEmail,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(20),
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: primarycolor,
                  ),
                  child: TextField(
                    controller: controllerPassword,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(20),
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                    ),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  // NOTE untuk tap Login
                  onTap: () async {
                    Fluttertoast.showToast(msg: "Tombol di klik");
                    // login
                    await auth
                        .signInWithEmailAndPassword(
                            email: contorllerEmail.text,
                            password: controllerPassword.text)
                        .then(
                      (value) {
                        Fluttertoast.showToast(msg: "Berhasil");
                        // return value;
                      },
                    ).catchError((e) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          content: Text('login gagal'),
                        ),
                      );
                    });

                    // jika berhasil
                    if (auth.currentUser != null) {
                      //pushreplacement gak bisa balik ke page awal
                      await FirebaseFirestore.instance
                          .collection('data_user')
                          .doc(auth.currentUser.uid)
                          .get()
                          .then((value) {
                        if (value.exists) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return MainPage();
                              },
                            ),
                          );
                        } else {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return PageProfil();
                              },
                            ),
                          );
                        }
                        return;
                      });
                    }
                    // jika gagal
                  },
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 20,
                            color: textPrimaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      height: 50,
                      // width: 300,
                      decoration: BoxDecoration(
                        border: Border.all(color: textPrimaryColor, width: 3),
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return PageResetPassword();
                          },
                        ),
                      );
                    },
                    child: Material(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.transparent,
                      child: Container(
                        height: 50,
                        width: 150,
                        alignment: Alignment.center,
                        child: Text(
                          "Lupa Password",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey),
                        ),
                      ),
                    ),
                  ),
                ),
                // Text("email : ${email.text}"),
                // Text("password : ${password.text}"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
