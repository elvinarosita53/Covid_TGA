import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:menu_login/main_page.dart';
import 'package:menu_login/page/page_login.dart';
import 'package:menu_login/widget/constant.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class PageResetAwal extends StatefulWidget {
  @override
  _PageResetAwalState createState() => _PageResetAwalState();
}

class _PageResetAwalState extends State<PageResetAwal> {
  var formkey = GlobalKey<FormState>();

  bool isLoading = false;

  FirebaseAuth auth = FirebaseAuth.instance;

  TextEditingController namaInstansi = TextEditingController();

  CollectionReference backendNamaInstansi =
      FirebaseFirestore.instance.collection('data_profil');

  @override
  Widget build(BuildContext context) {
    bool _keyboardIsVisible() {
      return !(MediaQuery.of(context).viewInsets.bottom == 0.0);
    }

    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Stack(
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
              padding:
                  EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 10),
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
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Card(
                  elevation: 4,
                  margin: EdgeInsets.only(left: 10, right: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Form(
                      key: formkey,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "Trimaksih sudah berkunjung di aplikasi kami inCOV (Informasi Covid-19), \nuntuk pertama sekali mohon untuk mengisikan nama isntasi anda.\nAgar kami dapat lebih mengenal anda.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              controller: namaInstansi,
                              validator: MultiValidator([
                                RequiredValidator(
                                    errorText:
                                        "Mohon di isi nama instansi anda")
                              ]),
                              decoration: InputDecoration(
                                fillColor: Colors.grey[300],
                                filled: true,
                                hintText: "Masukkan Nama Instansi Anda",
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            InkWell(
                              borderRadius: BorderRadius.circular(25),
                              onTap: () async {
                                if (formkey.currentState.validate()) {
                                  isLoading = true;
                                  setState(() {});
                                  await backendNamaInstansi
                                      .doc(auth.currentUser.uid)
                                      .set(
                                    {
                                      'nama': namaInstansi.text,
                                      "role": "instansi",
                                    },
                                  );
                                  isLoading = false;
                                  setState(() {});

                                  await showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text("Email Berhasil Dikirim"),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              //untu kembali ke page sebelumnya
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              "OK",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: primarycolor,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )
                                        ],
                                        content: Text(
                                            "Selamat Anda Sudah Masuk di Aplikasi Kami"),
                                      );
                                    },
                                  );

                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MainPage(),
                                    ),
                                  );
                                }
                              },
                              child: Material(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25),
                                child: Container(
                                  margin: EdgeInsets.all(3),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "MASUK",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  height: 50,
                                  width: 300,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: textPrimaryColor, width: 3),
                                    borderRadius: BorderRadius.circular(25),
                                    color: primarycolor,
                                  ),
                                ),
                              ),
                            ),
                            _keyboardIsVisible()
                                ? SizedBox()
                                : SizedBox(
                                    height: MediaQuery.of(context).size.height /
                                        7.5,
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
