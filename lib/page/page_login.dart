import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:menu_login/main_page.dart';
import 'package:menu_login/page/page_profil.dart';
import 'package:menu_login/page/page_resetPassword.dart';
import 'package:menu_login/widget/constant.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:form_field_validator/form_field_validator.dart';

class PageLogin extends StatefulWidget {
  final bool password;

  const PageLogin({this.password = false});

  @override
  _PageLoginState createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  var formkey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  bool isLoading = false;
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

      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 50,
                color: primarycolor,
              ),
              Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 40),
                    height: 250,
                    width: 400,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          "images/petugas.png",
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
              Form(
                key: formkey,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        validator: MultiValidator(
                          [
                            RequiredValidator(errorText: "Harap Di Isi"),
                            EmailValidator(errorText: "Email Anda Salah"),
                          ],
                        ),
                        controller: contorllerEmail,
                        style: TextStyle(color: primarycolor),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(20),
                          hintText: "Masukkan Email Anda",
                          hintStyle: TextStyle(color: Colors.grey),
                          fillColor: Colors.grey[200],
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        validator: MultiValidator(
                          [
                            RequiredValidator(errorText: "Harap Di Isi"),
                            MinLengthValidator(6,
                                errorText: "Minimal 6 Karakter"),
                          ],
                        ),
                        controller: controllerPassword,
                        style: TextStyle(color: primarycolor),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(20),
                          hintText: "Masukkan Password Anda",
                          hintStyle: TextStyle(color: Colors.grey),
                          fillColor: Colors.grey[200],
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () async {
                          if (formkey.currentState.validate()) {
                            isLoading = true;
                            setState(() {});
                            // print("diklik");
                            // print("email ${contorllerEmail.text}");
                            // print("password ${controllerPassword.text}");
                            try {
                              UserCredential userCredential = await FirebaseAuth
                                  .instance
                                  .signInWithEmailAndPassword(
                                      email: contorllerEmail.text,
                                      password: controllerPassword.text);
                              Fluttertoast.showToast(
                                msg: "Anda Berhasil Login",
                                backgroundColor: Colors.green[300],
                              );
                              print("${userCredential.user}");
                              setState(() {
                                isLoading = false;
                              });

                              FirebaseFirestore.instance
                                  .collection('data_user')
                                  .doc(auth.currentUser.uid)
                                  .get()
                                  .then(
                                (DocumentSnapshot documentSnapshot) {
                                  if (documentSnapshot.exists) {
                                    // print('Document exists on the database');
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MainPage(),
                                      ),
                                    );
                                  } else {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PageProfil(),
                                      ),
                                    );
                                  }
                                },
                              );
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'user-not-found') {
                                print('No user found for that email.');
                                Fluttertoast.showToast(
                                  msg: "Email Anda Salah",
                                  backgroundColor: Colors.red[300],
                                );
                              } else if (e.code == 'wrong-password') {
                                print('Wrong password provided for that user.');
                                Fluttertoast.showToast(
                                  msg: "Password Anda Salah",
                                  backgroundColor: Colors.red[300],
                                );
                              }
                            }
                          }
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
                              border:
                                  Border.all(color: textPrimaryColor, width: 3),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
