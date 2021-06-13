import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:menu_login/widget/input_profil.dart';
import 'package:menu_login/page/page_listAdmin.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
// import 'package:fluttertoast/fluttertoast.dart';

class PageProfil extends StatefulWidget {
  @override
  _PageProfilState createState() => _PageProfilState();
}

class _PageProfilState extends State<PageProfil> {
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    TextEditingController namacontroler = TextEditingController();
    TextEditingController emailcontroler = TextEditingController();
    TextEditingController passwordcontroler = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: Text("Input Profil"),
      ),
      body: ModalProgressHUD(
        inAsyncCall: isloading,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              InputProfil(
                nama: "Nama",
                keterangan: "Masukkan Nama Profil",
                controlernama: namacontroler,
              ),
              SizedBox(
                height: 25,
              ),
              InputProfil(
                nama: "Email",
                keterangan: "Masukkan Email",
                controlernama: emailcontroler,
              ),
              SizedBox(
                height: 25,
              ),
              InputProfil(
                nama: "Password",
                keterangan: "Masukkan Password Baru",
                controlernama: passwordcontroler,
                password: true,
              ),
              Text(
                "Note : Mohon di isi dengan password lainnya",
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 13,
                    color: Colors.grey),
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () async {
                      isloading = true;
                      setState(() {});
                      // deklarasi firebase
                      // CollectionReference
                      FirebaseFirestore profilFirebase =
                          FirebaseFirestore.instance;

                      // variabel yang nyimpan nama tabel(collaction)
                      CollectionReference data_profil =
                          profilFirebase.collection("data_profil");
                      //.add untuk simpan data ke firebase
                      await data_profil.add(
                        {
                          'nama profil': namacontroler.text,
                          'email profil': emailcontroler.text,
                          'password profil': passwordcontroler.text,
                        },
                      );
                      //.then((value) => Fluttertoast.showToast(
                      //     msg: "password telah berhasil di ganti"));
                      isloading = false;
                      setState(() {});
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          //NOTE data base userroll
                          builder: (context) => PageListAdmin(),
                        ),
                      );
                    },
                    child: Container(
                      child: Text(
                        "SUBMIT",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.blue[400],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      alignment: Alignment.center,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
