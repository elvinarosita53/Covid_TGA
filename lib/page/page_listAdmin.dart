import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:menu_login/widget/list_covid.dart';
import 'package:menu_login/page/page_login.dart';
import 'package:menu_login/template/template_admin.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PageListAdmin extends StatefulWidget {
  @override
  _PageListAdminState createState() => _PageListAdminState();
}

class _PageListAdminState extends State<PageListAdmin> {
  List dataCovid;
  CollectionReference data =
      FirebaseFirestore.instance.collection('data_covid');
  @override
  Widget build(BuildContext context) {
    return TemplateAdmin(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          QuerySnapshot result = await data.get();
          dataCovid = result.docs.map((perItem) => perItem.data()).toList();
          print("isi ${dataCovid}");
          setState(() {});
        },
      ),
      body:
          //yang mengahandel data di firebase tanpa hrs ada request
          StreamBuilder<QuerySnapshot>(
              stream: data.snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  // kalau ada data akan menampilkan apa ?
                  dataCovid = snapshot.data.docs
                      .map((perItem) => perItem.data())
                      .toList();
                  //listview.builder agar jumlah data sama dgn yg di inputkan secara otomatis
                  return ListView.builder(
                    //untuk perulangan jumlah data covid
                    itemCount: (dataCovid == null) ? 4 : dataCovid.length,
                    itemBuilder: (context, index) {
                      if (dataCovid != null) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: ListCovid(
                            nama: "Nama: ${dataCovid[index]["nama"]}",
                            keterangan_kasus:
                                "Keterangan: ${dataCovid[index]["keterangan"]}",
                          ),
                        );
                      }
                    },
                  );
                } else {
                  return Center(
                    child: SpinKitPumpingHeart(
                      color: Colors.pink[200],
                      size: 300,
                      duration: Duration(milliseconds: 500),

                      // controller: AnimationController(
                      //     vsync: ,
                      //     duration: const Duration(milliseconds: 1200)),
                    ),
                  );
                }
              }),
    );
  }
}
