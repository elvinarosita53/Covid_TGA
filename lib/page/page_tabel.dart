import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menu_login/main_page.dart';
import 'package:menu_login/page/page_login.dart';
import 'package:menu_login/widget/build_chart.dart';
import 'package:menu_login/widget/constant.dart';

class PageTabel extends StatefulWidget {
  @override
  _PageTabelState createState() => _PageTabelState();
}

class _PageTabelState extends State<PageTabel> {
  FirebaseAuth auth = FirebaseAuth.instance;
  List<Map> dataTampilKecamatan;
  Map<String, Map> kasusPerKecamatan;
  List dataKecamatan;
  List dataCovid;
  List total;
  bool isAscending = true;
  // String currentKecamatan;
  String currentKeterangan;

  CollectionReference backendTabel =
      FirebaseFirestore.instance.collection('data_covid');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primarycolor,
        title: Text(
          "Tabel Data Statistik",
          style: GoogleFonts.oswald(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        actions: [
          PopupMenuButton(
            icon: Icon(
              Icons.menu,
              size: 30,
              color: Colors.white,
            ),
            onSelected: (value) async {
              if (value == "Login") {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PageLogin();
                    },
                  ),
                );
              } else if (value == "Log Out") {
                await auth.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MainPage();
                    },
                  ),
                );
              }
              setState(() {});
            },
            itemBuilder: (context) => (auth.currentUser != null)
                ? [
                    PopupMenuItem(
                      child: Text("Log Out"),
                      value: "Log Out",
                    )
                  ]
                : [
                    PopupMenuItem(
                      child: Text("Login"),
                      value: "Login",
                    )
                  ],
          )
        ],
        elevation: 0,
      ),
      body: Column(
        children: [
          searchBox(context),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: StreamBuilder<QuerySnapshot>(
                    stream: backendTabel.snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        setAwalDataKecamatan();
                        dataCovid = snapshot.data.docs
                            .map((perItem) => perItem.data())
                            .toList();
                        dataKecamatan =
                            dataCovid.map((e) => e['kecamatan']).toList();
                        for (var i = 0; i < dataKecamatan.length; i++) {
                          switch (dataKecamatan[i]) {
                            case 'Kecamatan Bate':
                              filterKecamatan('Kecamatan Bate', dataCovid[i]);
                              break;
                            case "Kecamatan Delima":
                              filterKecamatan("Kecamatan Delima", dataCovid[i]);
                              break;
                            case "Kecamatan Geumpang Pidie":
                              filterKecamatan(
                                  "Kecamatan Geumpang Pidie", dataCovid[i]);
                              break;
                            case "Kecamatan Geulumpang Tiga":
                              filterKecamatan(
                                  "Kecamatan Geulumpang Tiga", dataCovid[i]);
                              break;
                            case "Kecamatan Glumpang Baro":
                              filterKecamatan(
                                  "Kecamatan Glumpang Baro", dataCovid[i]);
                              break;
                            case "Kecamatan Grong-Grong":
                              filterKecamatan(
                                  "Kecamatan Grong-Grong", dataCovid[i]);
                              break;
                            case "Kecamatan Indra Jaya":
                              filterKecamatan(
                                  "Kecamatan Indra Jaya", dataCovid[i]);
                              break;
                            case "Kecamatan Kembang Tanjong":
                              filterKecamatan(
                                  "Kecamatan Kembang Tanjong", dataCovid[i]);
                              break;
                            case "Kecamatan Keumala":
                              filterKecamatan(
                                  "Kecamatan Keumala", dataCovid[i]);
                              break;
                            case "Kecamatan Kota Sigli":
                              filterKecamatan(
                                  "Kecamatan Kota Sigli", dataCovid[i]);
                              break;
                            case "Kecamatan Mane":
                              filterKecamatan("Kecamatan Mane", dataCovid[i]);
                              break;
                            case "Kecamatan Muara Tiga":
                              filterKecamatan(
                                  "Kecamatan Muara Tiga", dataCovid[i]);
                              break;
                            case "Kecamatan Mutiara":
                              filterKecamatan(
                                  "Kecamatan Mutiara", dataCovid[i]);
                              break;
                            case "Kecamatan Mutiara Timur":
                              filterKecamatan(
                                  "Kecamatan Mutiara Timur", dataCovid[i]);
                              break;
                            case "Kecamatan Padang Tiji":
                              filterKecamatan(
                                  "Kecamatan Padang Tiji", dataCovid[i]);
                              break;
                            case 'kecamatan Bate':
                              filterKecamatan('kecamatan Bate', dataCovid[i]);
                              break;
                            case "Kecamatan Peukan Baro":
                              filterKecamatan(
                                  "Kecamatan Peukan Baro", dataCovid[i]);
                              break;
                            case "Kecamatan Pidie":
                              filterKecamatan("Kecamatan Pidie", dataCovid[i]);
                              break;
                            case "Kecamatan Sakti":
                              filterKecamatan("Kecamatan Sakti", dataCovid[i]);
                              break;
                            case "Kecamatan Simpang Tiga":
                              filterKecamatan(
                                  "Kecamatan Simpang Tiga", dataCovid[i]);
                              break;
                            case "Kecamatan Tangse":
                              filterKecamatan("Kecamatan Tangse", dataCovid[i]);
                              break;
                            case "Kecamatan Tiro":
                              filterKecamatan("Kecamatan Tiro", dataCovid[i]);
                              break;

                            case "Kecamatan Titeue":
                              filterKecamatan("Kecamatan Titeue", dataCovid[i]);
                              break;
                          }
                        }
                        //untuk proses data tabel
                        Map dataBaruKecamatan = {
                          "Kecamatan Bate": {},
                          "Kecamatan Delima": {},
                          "Kecamatan Geumpang Pidie": {},
                          "Kecamatan Geulumpang Tiga": {},
                          "Kecamatan Glumpang Baro": {},
                          "Kecamatan Grong-Grong": {},
                          "Kecamatan Indra Jaya": {},
                          "Kecamatan Kembang Tanjong": {},
                          "Kecamatan Keumala": {},
                          "Kecamatan Kota Sigli": {},
                          "Kecamatan Mane": {},
                          "Kecamatan Muara Tiga": {},
                          "Kecamatan Mutiara": {},
                          "Kecamatan Mutiara Timur": {},
                          "Kecamatan Padang Tiji": {},
                          "Kecamatan Peukan Baro": {},
                          "Kecamatan Pidie": {},
                          "Kecamatan Sakti": {},
                          "Kecamatan Simpang Tiga": {},
                          "Kecamatan Tangse": {},
                          "Kecamatan Tiro": {},
                          "Kecamatan Titeue": {},
                        };

                        kasusPerKecamatan.forEach(
                          (namaKecamatan, isiTerjumlah) {
                            // untuk data meninggal tertinggi berdasarkan usia
                            dataBaruKecamatan[namaKecamatan]['meninggal'] =
                                isiTerjumlah['Konfirmasi Meninggal'] +
                                    isiTerjumlah['Suspek Meninggal/Probable'];

                            // untuk data 5 keterangan
                            dataBaruKecamatan[namaKecamatan]['positif'] =
                                isiTerjumlah['Jumlah Kasus Konfirmasi'];

                            dataBaruKecamatan[namaKecamatan]['sembuh'] =
                                isiTerjumlah['Jumlah PDP Sehat'] +
                                    isiTerjumlah['Discarded'] +
                                    isiTerjumlah['Konfirmasi Sembuh'];
                            dataBaruKecamatan[namaKecamatan]['meninggal'] =
                                isiTerjumlah['Konfirmasi Meninggal'] +
                                    isiTerjumlah['Suspek Meninggal/Probable'];
                            dataBaruKecamatan[namaKecamatan]['dirawat'] =
                                isiTerjumlah['Konfirmasi Dirawat'];

                            dataBaruKecamatan[namaKecamatan]['tersuspek'] =
                                isiTerjumlah['Jumlah Suspek'] +
                                    isiTerjumlah['Suspek Dirawat'] +
                                    isiTerjumlah['Suspek Isolasi Mandiri'] +
                                    isiTerjumlah['Suspek Terkonfirmasi'] +
                                    isiTerjumlah['Konfirmasi Isolasi Mandiri'] +
                                    isiTerjumlah['Jumlah ODP Selesai Pantau'];
                          },
                        );
                        print('dataCovid : $dataCovid');
                        print('kecamatan $dataKecamatan');
                        print("kasus $kasusPerKecamatan");
                        print("data baru Kecamatan $dataBaruKecamatan");
                        dataTampilKecamatan = [];
                        dataBaruKecamatan.forEach((kecamatan, value) {
                          value.forEach((keterangan, total) {
                            if (total != 0) {
                              //untuk menambahkn item di list .add
                              dataTampilKecamatan.add(
                                {
                                  "kecamatan": kecamatan,
                                  'keterangan': keterangan,
                                  'total': total,
                                },
                              );
                              if (isAscending == true) {
                                // isAscending = false;
                                dataTampilKecamatan.sort(
                                    (a, b) => b['total'].compareTo(a['total']));
                              } else {
                                // isAscending = true;

                                dataTampilKecamatan.sort(
                                    (a, b) => a['total'].compareTo(b['total']));
                              }
                            }
                          });
                        });
                        print("data ta,pil $dataTampilKecamatan");
                        print("current keterangan $currentKeterangan");

                        return DataTable(
                            sortColumnIndex: 2,
                            sortAscending: isAscending,
                            horizontalMargin: 0,
                            columns: [
                              DataColumn(
                                label: Text(
                                  "Kecamatan",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: textPrimaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  "Keterangan",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: textPrimaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              DataColumn(
                                //mengurutkan data besar ke kecil atau kecil ke besar

                                onSort: (columnIndex, ascending) {
                                  print('ascending $ascending');
                                  if (ascending) {
                                    isAscending = true;
                                    // dataTampilKecamatan.sort((a, b) =>
                                    //     a['total'].compareTo(b['total']));
                                  } else {
                                    isAscending = false;
                                    // dataTampilKecamatan.sort((a, b) =>
                                    //     b['total'].compareTo(a['total']));
                                  }
                                  setState(() {});
                                },
                                label: Text(
                                  "Total",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: textPrimaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                            rows: dataTabel());
                      } else {
                        return Container(
                          height: MediaQuery.of(context).size.height - 230,
                          alignment: Alignment.center,
                          child: loading,
                        );
                      }
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<DataRow> dataTabel() {
    List<DataRow> dataTabel = [];
    for (var i = 0; i < dataTampilKecamatan.length; i++) {
      if (currentKeterangan == null) {
        dataTabel.add(
          DataRow(
            cells: [
              DataCell(
                Text(dataTampilKecamatan[i]["kecamatan"]),
              ),
              DataCell(
                Text(dataTampilKecamatan[i]["keterangan"]),
              ),
              DataCell(
                Text(dataTampilKecamatan[i]["total"].toString()),
              ),
            ],
          ),
        );
      } else if (currentKeterangan.toLowerCase() ==
          dataTampilKecamatan[i]['keterangan']) {
        dataTabel.add(
          DataRow(
            cells: [
              DataCell(
                Text(dataTampilKecamatan[i]["kecamatan"]),
              ),
              DataCell(
                Text(dataTampilKecamatan[i]["keterangan"]),
              ),
              DataCell(
                Text(dataTampilKecamatan[i]["total"].toString()),
              ),
            ],
          ),
        );
      } else {
        continue;
      }
    }
    return dataTabel;
  }

  Widget searchBox(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        color: primarycolor,
      ),
      padding: EdgeInsets.only(bottom: 20, left: 20, right: 20),
      child: Container(
        padding: EdgeInsets.only(left: 10),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: primarySearchColor, borderRadius: BorderRadius.circular(40)),
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
            hintStyle: TextStyle(color: Colors.white),
            border: InputBorder.none,
            isDense: true,
            contentPadding: EdgeInsets.zero,
          ),
          items: [
            'meninggal',
            'tersuspek',
            'dirawat',
            'sembuh',
            'positif',
          ],

          hint: "Search",
          maxHeight: 300,
          showClearButton: true,
          clearButtonBuilder: (context) => Icon(Icons.cancel),
          // label: "Search",
          onChanged: (value) {
            currentKeterangan = value;
            setState(() {});
          },
          showSearchBox: true,
        ),
      ),
    );
  }

  //metode untuk seting data kasus agar penambahannya kembali ke awal
  void setAwalDataKecamatan() {
    kasusPerKecamatan = {
      "Kecamatan Bate": {
        'PDP': 0,
        'ODP': 0,
        'OTG': 0,
        'Jumlah ODP Selesai Pantau': 0,
        'Jumlah Suspek': 0,
        'Suspek Dirawat': 0,
        'Suspek Isolasi Mandiri': 0,
        'Suspek Terkonfirmasi': 0,
        'Konfirmasi Isolasi Mandiri': 0,
        'Jumlah PDP Sehat': 0,
        'Discarded': 0,
        'Konfirmasi Sembuh': 0,
        'Konfirmasi Meninggal': 0,
        'Suspek Meninggal/Probable': 0,
        'Konfirmasi Dirawat': 0,
        'Jumlah Kasus Konfirmasi': 0,
      },
      "Kecamatan Delima": {
        'PDP': 0,
        'ODP': 0,
        'OTG': 0,
        'Jumlah ODP Selesai Pantau': 0,
        'Jumlah Suspek': 0,
        'Suspek Dirawat': 0,
        'Suspek Isolasi Mandiri': 0,
        'Suspek Terkonfirmasi': 0,
        'Konfirmasi Isolasi Mandiri': 0,
        'Jumlah PDP Sehat': 0,
        'Discarded': 0,
        'Konfirmasi Sembuh': 0,
        'Konfirmasi Meninggal': 0,
        'Suspek Meninggal/Probable': 0,
        'Konfirmasi Dirawat': 0,
        'Jumlah Kasus Konfirmasi': 0,
      },
      "Kecamatan Geumpang Pidie": {
        'PDP': 0,
        'ODP': 0,
        'OTG': 0,
        'Jumlah ODP Selesai Pantau': 0,
        'Jumlah Suspek': 0,
        'Suspek Dirawat': 0,
        'Suspek Isolasi Mandiri': 0,
        'Suspek Terkonfirmasi': 0,
        'Konfirmasi Isolasi Mandiri': 0,
        'Jumlah PDP Sehat': 0,
        'Discarded': 0,
        'Konfirmasi Sembuh': 0,
        'Konfirmasi Meninggal': 0,
        'Suspek Meninggal/Probable': 0,
        'Konfirmasi Dirawat': 0,
        'Jumlah Kasus Konfirmasi': 0,
      },
      "Kecamatan Geulumpang Tiga": {
        'PDP': 0,
        'ODP': 0,
        'OTG': 0,
        'Jumlah ODP Selesai Pantau': 0,
        'Jumlah Suspek': 0,
        'Suspek Dirawat': 0,
        'Suspek Isolasi Mandiri': 0,
        'Suspek Terkonfirmasi': 0,
        'Konfirmasi Isolasi Mandiri': 0,
        'Jumlah PDP Sehat': 0,
        'Discarded': 0,
        'Konfirmasi Sembuh': 0,
        'Konfirmasi Meninggal': 0,
        'Suspek Meninggal/Probable': 0,
        'Konfirmasi Dirawat': 0,
        'Jumlah Kasus Konfirmasi': 0,
      },
      "Kecamatan Glumpang Baro": {
        'PDP': 0,
        'ODP': 0,
        'OTG': 0,
        'Jumlah ODP Selesai Pantau': 0,
        'Jumlah Suspek': 0,
        'Suspek Dirawat': 0,
        'Suspek Isolasi Mandiri': 0,
        'Suspek Terkonfirmasi': 0,
        'Konfirmasi Isolasi Mandiri': 0,
        'Jumlah PDP Sehat': 0,
        'Discarded': 0,
        'Konfirmasi Sembuh': 0,
        'Konfirmasi Meninggal': 0,
        'Suspek Meninggal/Probable': 0,
        'Konfirmasi Dirawat': 0,
        'Jumlah Kasus Konfirmasi': 0,
      },
      "Kecamatan Grong-Grong": {
        'PDP': 0,
        'ODP': 0,
        'OTG': 0,
        'Jumlah ODP Selesai Pantau': 0,
        'Jumlah Suspek': 0,
        'Suspek Dirawat': 0,
        'Suspek Isolasi Mandiri': 0,
        'Suspek Terkonfirmasi': 0,
        'Konfirmasi Isolasi Mandiri': 0,
        'Jumlah PDP Sehat': 0,
        'Discarded': 0,
        'Konfirmasi Sembuh': 0,
        'Konfirmasi Meninggal': 0,
        'Suspek Meninggal/Probable': 0,
        'Konfirmasi Dirawat': 0,
        'Jumlah Kasus Konfirmasi': 0,
      },
      "Kecamatan Indra Jaya": {
        'PDP': 0,
        'ODP': 0,
        'OTG': 0,
        'Jumlah ODP Selesai Pantau': 0,
        'Jumlah Suspek': 0,
        'Suspek Dirawat': 0,
        'Suspek Isolasi Mandiri': 0,
        'Suspek Terkonfirmasi': 0,
        'Konfirmasi Isolasi Mandiri': 0,
        'Jumlah PDP Sehat': 0,
        'Discarded': 0,
        'Konfirmasi Sembuh': 0,
        'Konfirmasi Meninggal': 0,
        'Suspek Meninggal/Probable': 0,
        'Konfirmasi Dirawat': 0,
        'Jumlah Kasus Konfirmasi': 0,
      },
      "Kecamatan Kembang Tanjong": {
        'PDP': 0,
        'ODP': 0,
        'OTG': 0,
        'Jumlah ODP Selesai Pantau': 0,
        'Jumlah Suspek': 0,
        'Suspek Dirawat': 0,
        'Suspek Isolasi Mandiri': 0,
        'Suspek Terkonfirmasi': 0,
        'Konfirmasi Isolasi Mandiri': 0,
        'Jumlah PDP Sehat': 0,
        'Discarded': 0,
        'Konfirmasi Sembuh': 0,
        'Konfirmasi Meninggal': 0,
        'Suspek Meninggal/Probable': 0,
        'Konfirmasi Dirawat': 0,
        'Jumlah Kasus Konfirmasi': 0,
      },
      "Kecamatan Keumala": {
        'PDP': 0,
        'ODP': 0,
        'OTG': 0,
        'Jumlah ODP Selesai Pantau': 0,
        'Jumlah Suspek': 0,
        'Suspek Dirawat': 0,
        'Suspek Isolasi Mandiri': 0,
        'Suspek Terkonfirmasi': 0,
        'Konfirmasi Isolasi Mandiri': 0,
        'Jumlah PDP Sehat': 0,
        'Discarded': 0,
        'Konfirmasi Sembuh': 0,
        'Konfirmasi Meninggal': 0,
        'Suspek Meninggal/Probable': 0,
        'Konfirmasi Dirawat': 0,
        'Jumlah Kasus Konfirmasi': 0,
      },
      "Kecamatan Kota Sigli": {
        'PDP': 0,
        'ODP': 0,
        'OTG': 0,
        'Jumlah ODP Selesai Pantau': 0,
        'Jumlah Suspek': 0,
        'Suspek Dirawat': 0,
        'Suspek Isolasi Mandiri': 0,
        'Suspek Terkonfirmasi': 0,
        'Konfirmasi Isolasi Mandiri': 0,
        'Jumlah PDP Sehat': 0,
        'Discarded': 0,
        'Konfirmasi Sembuh': 0,
        'Konfirmasi Meninggal': 0,
        'Suspek Meninggal/Probable': 0,
        'Konfirmasi Dirawat': 0,
        'Jumlah Kasus Konfirmasi': 0,
      },
      "Kecamatan Mane": {
        'PDP': 0,
        'ODP': 0,
        'OTG': 0,
        'Jumlah ODP Selesai Pantau': 0,
        'Jumlah Suspek': 0,
        'Suspek Dirawat': 0,
        'Suspek Isolasi Mandiri': 0,
        'Suspek Terkonfirmasi': 0,
        'Konfirmasi Isolasi Mandiri': 0,
        'Jumlah PDP Sehat': 0,
        'Discarded': 0,
        'Konfirmasi Sembuh': 0,
        'Konfirmasi Meninggal': 0,
        'Suspek Meninggal/Probable': 0,
        'Konfirmasi Dirawat': 0,
        'Jumlah Kasus Konfirmasi': 0,
      },
      "Kecamatan Muara Tiga": {
        'PDP': 0,
        'ODP': 0,
        'OTG': 0,
        'Jumlah ODP Selesai Pantau': 0,
        'Jumlah Suspek': 0,
        'Suspek Dirawat': 0,
        'Suspek Isolasi Mandiri': 0,
        'Suspek Terkonfirmasi': 0,
        'Konfirmasi Isolasi Mandiri': 0,
        'Jumlah PDP Sehat': 0,
        'Discarded': 0,
        'Konfirmasi Sembuh': 0,
        'Konfirmasi Meninggal': 0,
        'Suspek Meninggal/Probable': 0,
        'Konfirmasi Dirawat': 0,
        'Jumlah Kasus Konfirmasi': 0,
      },
      "Kecamatan Mutiara": {
        'PDP': 0,
        'ODP': 0,
        'OTG': 0,
        'Jumlah ODP Selesai Pantau': 0,
        'Jumlah Suspek': 0,
        'Suspek Dirawat': 0,
        'Suspek Isolasi Mandiri': 0,
        'Suspek Terkonfirmasi': 0,
        'Konfirmasi Isolasi Mandiri': 0,
        'Jumlah PDP Sehat': 0,
        'Discarded': 0,
        'Konfirmasi Sembuh': 0,
        'Konfirmasi Meninggal': 0,
        'Suspek Meninggal/Probable': 0,
        'Konfirmasi Dirawat': 0,
        'Jumlah Kasus Konfirmasi': 0,
      },
      "Kecamatan Mutiara Timur": {
        'PDP': 0,
        'ODP': 0,
        'OTG': 0,
        'Jumlah ODP Selesai Pantau': 0,
        'Jumlah Suspek': 0,
        'Suspek Dirawat': 0,
        'Suspek Isolasi Mandiri': 0,
        'Suspek Terkonfirmasi': 0,
        'Konfirmasi Isolasi Mandiri': 0,
        'Jumlah PDP Sehat': 0,
        'Discarded': 0,
        'Konfirmasi Sembuh': 0,
        'Konfirmasi Meninggal': 0,
        'Suspek Meninggal/Probable': 0,
        'Konfirmasi Dirawat': 0,
        'Jumlah Kasus Konfirmasi': 0,
      },
      "Kecamatan Padang Tiji": {
        'PDP': 0,
        'ODP': 0,
        'OTG': 0,
        'Jumlah ODP Selesai Pantau': 0,
        'Jumlah Suspek': 0,
        'Suspek Dirawat': 0,
        'Suspek Isolasi Mandiri': 0,
        'Suspek Terkonfirmasi': 0,
        'Konfirmasi Isolasi Mandiri': 0,
        'Jumlah PDP Sehat': 0,
        'Discarded': 0,
        'Konfirmasi Sembuh': 0,
        'Konfirmasi Meninggal': 0,
        'Suspek Meninggal/Probable': 0,
        'Konfirmasi Dirawat': 0,
        'Jumlah Kasus Konfirmasi': 0,
      },
      "Kecamatan Peukan Baro": {
        'PDP': 0,
        'ODP': 0,
        'OTG': 0,
        'Jumlah ODP Selesai Pantau': 0,
        'Jumlah Suspek': 0,
        'Suspek Dirawat': 0,
        'Suspek Isolasi Mandiri': 0,
        'Suspek Terkonfirmasi': 0,
        'Konfirmasi Isolasi Mandiri': 0,
        'Jumlah PDP Sehat': 0,
        'Discarded': 0,
        'Konfirmasi Sembuh': 0,
        'Konfirmasi Meninggal': 0,
        'Suspek Meninggal/Probable': 0,
        'Konfirmasi Dirawat': 0,
        'Jumlah Kasus Konfirmasi': 0,
      },
      "Kecamatan Pidie": {
        'PDP': 0,
        'ODP': 0,
        'OTG': 0,
        'Jumlah ODP Selesai Pantau': 0,
        'Jumlah Suspek': 0,
        'Suspek Dirawat': 0,
        'Suspek Isolasi Mandiri': 0,
        'Suspek Terkonfirmasi': 0,
        'Konfirmasi Isolasi Mandiri': 0,
        'Jumlah PDP Sehat': 0,
        'Discarded': 0,
        'Konfirmasi Sembuh': 0,
        'Konfirmasi Meninggal': 0,
        'Suspek Meninggal/Probable': 0,
        'Konfirmasi Dirawat': 0,
        'Jumlah Kasus Konfirmasi': 0,
      },
      "Kecamatan Sakti": {
        'PDP': 0,
        'ODP': 0,
        'OTG': 0,
        'Jumlah ODP Selesai Pantau': 0,
        'Jumlah Suspek': 0,
        'Suspek Dirawat': 0,
        'Suspek Isolasi Mandiri': 0,
        'Suspek Terkonfirmasi': 0,
        'Konfirmasi Isolasi Mandiri': 0,
        'Jumlah PDP Sehat': 0,
        'Discarded': 0,
        'Konfirmasi Sembuh': 0,
        'Konfirmasi Meninggal': 0,
        'Suspek Meninggal/Probable': 0,
        'Konfirmasi Dirawat': 0,
        'Jumlah Kasus Konfirmasi': 0,
      },
      "Kecamatan Simpang Tiga": {
        'PDP': 0,
        'ODP': 0,
        'OTG': 0,
        'Jumlah ODP Selesai Pantau': 0,
        'Jumlah Suspek': 0,
        'Suspek Dirawat': 0,
        'Suspek Isolasi Mandiri': 0,
        'Suspek Terkonfirmasi': 0,
        'Konfirmasi Isolasi Mandiri': 0,
        'Jumlah PDP Sehat': 0,
        'Discarded': 0,
        'Konfirmasi Sembuh': 0,
        'Konfirmasi Meninggal': 0,
        'Suspek Meninggal/Probable': 0,
        'Konfirmasi Dirawat': 0,
        'Jumlah Kasus Konfirmasi': 0,
      },
      "Kecamatan Tangse": {
        'PDP': 0,
        'ODP': 0,
        'OTG': 0,
        'Jumlah ODP Selesai Pantau': 0,
        'Jumlah Suspek': 0,
        'Suspek Dirawat': 0,
        'Suspek Isolasi Mandiri': 0,
        'Suspek Terkonfirmasi': 0,
        'Konfirmasi Isolasi Mandiri': 0,
        'Jumlah PDP Sehat': 0,
        'Discarded': 0,
        'Konfirmasi Sembuh': 0,
        'Konfirmasi Meninggal': 0,
        'Suspek Meninggal/Probable': 0,
        'Konfirmasi Dirawat': 0,
        'Jumlah Kasus Konfirmasi': 0,
      },
      "Kecamatan Tiro": {
        'PDP': 0,
        'ODP': 0,
        'OTG': 0,
        'Jumlah ODP Selesai Pantau': 0,
        'Jumlah Suspek': 0,
        'Suspek Dirawat': 0,
        'Suspek Isolasi Mandiri': 0,
        'Suspek Terkonfirmasi': 0,
        'Konfirmasi Isolasi Mandiri': 0,
        'Jumlah PDP Sehat': 0,
        'Discarded': 0,
        'Konfirmasi Sembuh': 0,
        'Konfirmasi Meninggal': 0,
        'Suspek Meninggal/Probable': 0,
        'Konfirmasi Dirawat': 0,
        'Jumlah Kasus Konfirmasi': 0,
      },
      "Kecamatan Titeue": {
        'PDP': 0,
        'ODP': 0,
        'OTG': 0,
        'Jumlah ODP Selesai Pantau': 0,
        'Jumlah Suspek': 0,
        'Suspek Dirawat': 0,
        'Suspek Isolasi Mandiri': 0,
        'Suspek Terkonfirmasi': 0,
        'Konfirmasi Isolasi Mandiri': 0,
        'Jumlah PDP Sehat': 0,
        'Discarded': 0,
        'Konfirmasi Sembuh': 0,
        'Konfirmasi Meninggal': 0,
        'Suspek Meninggal/Probable': 0,
        'Konfirmasi Dirawat': 0,
        'Jumlah Kasus Konfirmasi': 0,
      },
    };
  }

//metod untuk filter keterangan saat penambahan data berdasarkan keterangan kasus
  void filterKecamatan(String kecamatan, Map perItem) {
    if (perItem['keterangan'] == "PDP") {
      kasusPerKecamatan[kecamatan]['PDP']++;
      //
    } else if (perItem['keterangan'] == "ODP") {
      kasusPerKecamatan[kecamatan]['ODP']++;
      //
    } else if (perItem['keterangan'] == "OTG") {
      kasusPerKecamatan[kecamatan]['OTG']++;
      //
    } else if (perItem['keterangan'] == "Jumlah ODP Selesai Pantau") {
      kasusPerKecamatan[kecamatan]['Jumlah ODP Selesai Pantau']++;
      //
    } else if (perItem['keterangan'] == "Jumlah PDP Sehat") {
      kasusPerKecamatan[kecamatan]['Jumlah PDP Sehat']++;
      //
    } else if (perItem['keterangan'] == "Jumlah Suspek") {
      kasusPerKecamatan[kecamatan]['Jumlah Suspek']++;
      //
    } else if (perItem['keterangan'] == "Suspek Dirawat") {
      kasusPerKecamatan[kecamatan]['Suspek Dirawat']++;
      //
    } else if (perItem['keterangan'] == "Suspek Isolasi Mandiri") {
      kasusPerKecamatan[kecamatan]['Suspek Isolasi Mandiri']++;
      //
    } else if (perItem['keterangan'] == "Suspek Terkonfirmasi") {
      kasusPerKecamatan[kecamatan]['Suspek Terkonfirmasi']++;
      //
    } else if (perItem['keterangan'] == "Discarded") {
      kasusPerKecamatan[kecamatan]["Discarded"]++;
      //
    } else if (perItem['keterangan'] == "Suspek Meninggal/Probable") {
      kasusPerKecamatan[kecamatan]["Suspek Meninggal/Probable"]++;
      //
    } else if (perItem['keterangan'] == "Jumlah Kasus Konfirmasi") {
      kasusPerKecamatan[kecamatan]["Jumlah Kasus Konfirmasi"]++;
      //
    } else if (perItem['keterangan'] == "Konfirmasi Dirawat") {
      kasusPerKecamatan[kecamatan]["Konfirmasi Dirawat"]++;
      //
    } else if (perItem['keterangan'] == "Konfirmasi Isolasi Mandiri") {
      kasusPerKecamatan[kecamatan]["Konfirmasi Isolasi Mandiri"]++;
      //
    } else if (perItem['keterangan'] == "Konfirmasi Sembuh") {
      kasusPerKecamatan[kecamatan]["Konfirmasi Sembuh"]++;
      //
    } else if (perItem['keterangan'] == "Konfirmasi Meninggal") {
      kasusPerKecamatan[kecamatan]["Konfirmasi Meninggal"]++;
    }
  }
}
