import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:menu_login/main_page.dart';
import 'package:menu_login/widget/constant.dart';

class PageProfil extends StatelessWidget {
  TextEditingController contorllerEmail = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            alignment: Alignment(0.8, -0.3),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.format_quote,
                  color: Colors.white,
                  size: 50,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Selamat Bergabung \ndi",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "inCov",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 30,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "(Informasi Covid-19)",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
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
          Container(
            padding: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 10),
            height: 400,
            width: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/Doctor Hijab.png"),
              ),
              color: Colors.transparent,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(70),
                  bottomRight: Radius.circular(70)),
            ),
          ),
          Card(
            elevation: 4,
            margin: EdgeInsets.only(
              top: 310,
              left: 10,
              right: 10,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Terimakasih telah bergabung bersama kami inCov (informasi Covid-19). Silahkan melakukan reset password untuk pertama sekali login, jika anda yakin silahkan klik Reset Password di bawah ini",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(25),
                    onTap: () async {
                      await auth
                          .sendPasswordResetEmail(email: contorllerEmail.text)
                          .then(
                        (value) {
                          Fluttertoast.showToast(
                              msg: "silahkan cek email anda");
                        },
                      );
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text("Silakan cek email anda"),
                          );
                        },
                      );
                    },
                    child: Material(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        margin: EdgeInsets.all(3),
                        alignment: Alignment.center,
                        child: Text(
                          "Reset Password",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        height: 50,
                        width: 300,
                        decoration: BoxDecoration(
                          border: Border.all(color: textPrimaryColor, width: 3),
                          borderRadius: BorderRadius.circular(25),
                          color: primarycolor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
