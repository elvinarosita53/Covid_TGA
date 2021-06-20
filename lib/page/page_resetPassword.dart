import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:menu_login/widget/constant.dart';

class PageResetPassword extends StatelessWidget {
  TextEditingController contorllerEmail = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 10),
            child: Text(
              judulPanduan,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
              textAlign: TextAlign.center,
            ),
            height: 400,
            width: 400,
            decoration: BoxDecoration(
              color: primarycolor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(70),
                  bottomRight: Radius.circular(70)),
            ),
          ),
          Card(
            elevation: 4,
            margin: EdgeInsets.only(
              top: 250,
              left: 10,
              right: 10,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  child: Text(
                    "Email Address",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: primarycolor),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: contorllerEmail,
                    decoration: InputDecoration(
                      hintText: "Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    await auth
                        .sendPasswordResetEmail(email: contorllerEmail.text)
                        .then((value) {
                      Fluttertoast.showToast(msg: "silahkan cek email anda");
                    });
                  },
                  child: Container(
                    child: Center(
                      child: Text(
                        "Reset Password",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[800]),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadiusDirectional.all(Radius.circular(20))),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
