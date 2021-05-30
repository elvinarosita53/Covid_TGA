import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:menu_login/profil.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // deklarasi firebase
    FirebaseFirestore emailFirebase = FirebaseFirestore.instance;

    // variabel yang nyimpan nama tabel(collaction)
    CollectionReference user_pengguna =
        emailFirebase.collection("user_pengguna");

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          user_pengguna.add({
            'email': email.text,
            'password': password.text,
          });
          email.text = '';
          password.text = '';
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
                    controller: email,
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
                    controller: password,
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
                    onTap: () {
                      //pushreplacement gak bisa balik ke page awal
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) {
                          return Profil();
                        },
                      ));
                    },
                    child: Container(
                      child: Center(
                        child: Text(
                          "LOGIN",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.blue[900],
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
