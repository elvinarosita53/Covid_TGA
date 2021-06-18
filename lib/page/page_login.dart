import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:menu_login/main_page.dart';
import 'package:menu_login/page/page_profil.dart';

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
      backgroundColor: Colors.blue[100],
      body: GestureDetector(
        onTap: () {
          user_pengguna.add({
            //bentu map
            'email': contorllerEmail.text,
            'password': controllerPassword.text,
          });
          contorllerEmail.text = '';
          controllerPassword.text = '';
          setState(() {});
        },
        child: Container(
          margin: EdgeInsets.all(10),
          child: ListView(
            children: [
              Image(
                width: 300,
                image: AssetImage("images/Circle Doctors.png"),
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: contorllerEmail,
                    decoration: InputDecoration(
                      hintText: "Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    obscureText: true,
                    controller: controllerPassword,
                    decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () async {
                      Fluttertoast.showToast(msg: "Tombol di klik");
                      await auth
                          .signInWithEmailAndPassword(
                              email: contorllerEmail.text,
                              password: controllerPassword.text)
                          .then(
                        (value) {
                          Fluttertoast.showToast(msg: "Berhasil");
                          // return value;
                        },
                      );
                      //pushreplacement gak bisa balik ke page awal
                      // Navigator.pushReplacement(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) {
                      //       return MainPage();
                      //     },
                      //   ),
                      // );
                    },
                    child: Container(
                      child: Center(
                        child: Text(
                          "LOGIN",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[800]),
                        ),
                      ),
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadiusDirectional.all(Radius.circular(20))),
                    ),
                  ),
                  // Text("email : ${email.text}"),
                  // Text("password : ${password.text}"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
