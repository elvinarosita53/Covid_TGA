import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:menu_login/page/page_formInput.dart';
import 'package:menu_login/widget/constant.dart';
import 'package:menu_login/widget/list_covid.dart';
import 'package:menu_login/template/template_bersama.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PageListAdmin extends StatefulWidget {
  @override
  _PageListAdminState createState() => _PageListAdminState();
}

class _PageListAdminState extends State<PageListAdmin> {
  String currentpilih;
  ScrollController controller = ScrollController();
  bool upAndDown = true;
  List dataCovid;
  FirebaseAuth auth = FirebaseAuth.instance;
  CollectionReference backendFirebase =
      FirebaseFirestore.instance.collection('data_covid');
  CollectionReference backendInstansi =
      FirebaseFirestore.instance.collection('data_profil');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(() {
      if (controller.position.userScrollDirection == ScrollDirection.forward) {
        upAndDown = true;
        setState(() {});
      } else if (controller.position.userScrollDirection ==
          ScrollDirection.reverse) {
        upAndDown = false;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
        future: backendInstansi.doc(auth.currentUser.uid).get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Map result = snapshot.data.data();
            print("result :  $result");

            return TemplateBersama(
              floatingActionButton: Stack(
                children: [
                  AnimatedPositioned(
                    // left: 300,
                    right: 0,
                    bottom: upAndDown ? 0 : -100,
                    duration: Duration(milliseconds: 300),
                    child: FloatingActionButton(
                      backgroundColor: primarycolor,
                      child: Icon(Icons.add),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return PageFormInput(
                                namaAsalUser: result['nama'],
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              namaAppbar: result['nama'],
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, bottom: 10, top: 10),
                child: DropdownSearch<String>(
                  dropdownButtonBuilder: (context) => CircleAvatar(
                    child: Icon(
                      Icons.arrow_drop_down,
                      size: 35,
                      color: primarycolor,
                    ),
                    radius: 25,
                    backgroundColor: Colors.white,
                  ),
                  dropdownSearchDecoration: InputDecoration(
                    fillColor: Colors.white.withOpacity(0.4),
                    filled: true,
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none),
                    isDense: true,
                    contentPadding: EdgeInsets.only(left: 10),
                  ),
                  items: [
                    "kec.a",
                    "kec.b",
                    "kec.c",
                    "kec.d",
                    "kec.e",
                  ],

                  hint: "Search",
                  maxHeight: 300,
                  showClearButton: true,
                  clearButtonBuilder: (context) => Icon(Icons.cancel),
                  // label: "Search",
                  onChanged: (value) {
                    currentpilih = value;
                    // currentKecamatan = value;
                    setState(() {});
                  },
                  showSearchBox: true,
                ),
              ),
              body:
                  //yang mengahandel data di firebase tanpa hrs ada request
                  //secara realtime stream namanya
                  StreamBuilder<QuerySnapshot>(
                      stream: (result['role'] == 'admin')
                          ? (currentpilih == null)
                              ? backendFirebase.snapshots()
                              : backendFirebase
                                  .where('kecamatan', isEqualTo: currentpilih)
                                  .snapshots()
                          : (currentpilih == null)
                              ? backendFirebase
                                  .where('kecamatan', isEqualTo: currentpilih)
                                  .where('uploded by id',
                                      isEqualTo: auth.currentUser.uid)
                                  .snapshots()
                              : backendFirebase
                                  .where('kecamatan', isEqualTo: currentpilih)
                                  .where('uplded by id',
                                      isEqualTo: auth.currentUser.uid)
                                  .snapshots(),
                      builder: (context, snapshot) {
                        // print("role : ${result['role']}");
                        if (snapshot.hasData) {
                          // kalau ada data akan menampilkan apa ?
                          dataCovid = snapshot.data.docs
                              .map((perItem) => perItem.data())
                              .toList();
                          //untuk menyeleksi berdasarkan current ID
                          List listID = snapshot.data.docs
                              .map((perItem) => perItem.id)
                              .toList();
                          //listview.builder agar jumlah data sama dgn yg di inputkan secara otomatis
                          return ListView.builder(
                            //untuk perulangan jumlah data covid
                            controller: controller,
                            itemCount: dataCovid.length,
                            itemBuilder: (context, index) {
                              if (dataCovid != null) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: ListCovid(
                                    onFormInput: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          //NOTE data base userroll
                                          builder: (context) => PageFormInput(
                                            namaAsalUser: listID[index],
                                            dataCovid: dataCovid[index],
                                          ),
                                        ),
                                      );
                                    },
                                    nama: "Nama: ${dataCovid[index]["nama"]}",
                                    keterangan_kasus:
                                        "Kecamatan: ${dataCovid[index]["kecamatan"]}",
                                    uplodedBy: (result['role'] == 'admin')
                                        ? "uploaded by : ${dataCovid[index]["uploded by nama"]}"
                                        : null,
                                    onHapus: () async {
                                      await showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Text("Warning"),
                                            content: Text(
                                                "Apakah anda yakin mau menghapus data Nama: ${dataCovid[index]["nama"]}, Kecamatan: ${dataCovid[index]["kecamatan"]} "),
                                            actions: [
                                              TextButton(
                                                child: Text("Tidak"),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                              ),
                                              ElevatedButton(
                                                child: Text("Ya"),
                                                onPressed: () async {
                                                  Navigator.pop(context);
                                                  await FirebaseFirestore
                                                      .instance
                                                      .collection('data_covid')
                                                      .doc(listID[index])
                                                      .delete()
                                                      .then((value) {
                                                    // Fluttertoast.showToast(
                                                    //     msg: "Berhasil");
                                                  });
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  ),
                                );
                              }
                            },
                          );
                        } else {
                          return Container(
                            height: MediaQuery.of(context).size.height - 230,
                            alignment: Alignment.center,
                            child: loading,
                          );
                        }
                      }),
            );
          } else {
            return loading;
          }
        });
  }
}
