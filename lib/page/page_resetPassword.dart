import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:menu_login/widget/constant.dart';

class PageResetPassword extends StatelessWidget {
  var formkey = GlobalKey<FormState>();
  TextEditingController contorllerEmail = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    bool _keyboardIsVisible() {
      return !(MediaQuery.of(context).viewInsets.bottom == 0.0);
    }

    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 10,
                left: 20,
                right: 20,
                bottom: 10),
            child: Column(
              children: [
                Text(
                  "Lupa Password ?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Silahkan Masukkan Email Anda, dan Lakukan Reset Password",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),

            height: MediaQuery.of(context).size.height / 2, //
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: primarycolor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(70),
                  bottomRight: Radius.circular(70)),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Card(
              elevation: 4,
              margin: EdgeInsets.symmetric(horizontal: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 20, bottom: 10),
                      child: Text(
                        "Alamat Email",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: primarycolor),
                      ),
                    ),
                    Form(
                      key: formkey,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                          validator: MultiValidator(
                            [
                              RequiredValidator(errorText: "Harap Di Isi"),
                              EmailValidator(errorText: "Email Anda Salah"),
                            ],
                          ),
                          controller: contorllerEmail,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: "Masukkan Email Anda",
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide:
                                  BorderSide(color: primarycolor, width: 2),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (formkey.currentState.validate()) {
                          await auth
                              .sendPasswordResetEmail(
                                  email: contorllerEmail.text)
                              .then(
                            (value) {
                              Fluttertoast.showToast(
                                  msg: "silahkan cek email anda");
                            },
                          );
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 20,
                        ),
                        margin: EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 10,
                        ),
                        child: Center(
                          child: Text(
                            "Reset Password",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: primarycolor,
                          borderRadius: BorderRadiusDirectional.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    _keyboardIsVisible()
                        ? SizedBox()
                        : SizedBox(
                            height: MediaQuery.of(context).size.height / 3.3,
                          ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
