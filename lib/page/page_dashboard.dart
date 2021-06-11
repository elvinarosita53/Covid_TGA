import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:menu_login/widget/boxGrafik.dart';
import 'package:menu_login/widget/build_chart.dart';
import 'package:menu_login/widget/build_kesimpulan.dart';
import 'package:menu_login/widget/cardKesimpulan.dart';
import 'package:menu_login/widget/constant.dart';
import 'package:menu_login/template/template.dart';
import 'package:menu_login/widget/tabelBottomShow.dart';

// //searchBox
// searchBox(context),
// //grafik data
// buildChart(context),
// //carosel
// buildCarosel(),
class PageDashboard extends StatefulWidget {
  @override
  _PageDashboardState createState() => _PageDashboardState();
}

class _PageDashboardState extends State<PageDashboard> {
  String currentKecamatan;
  List dataCovid;
  int keterangan = 0;
  Map kasus = {
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
  };
  CollectionReference backendGrafik =
      FirebaseFirestore.instance.collection('data_covid');
  @override
  Widget build(BuildContext context) {
    return Template(
      body: ListView(
        children: [
          searchBox(context),
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            margin: EdgeInsets.all(15),
            child: BuildChart(),
          ),
          buildCarosel(),
          //NOTE untuk botton kesimpulan grafik
          BuildKesimpulan(),
        ],
      ),
    );
  }

//NOTE untuk bagian search
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
            currentKecamatan = value;
            setState(() {});
          },
          showSearchBox: true,
        ),
      ),
    );
  }

//NOTE untuk carousel geser datanya
  Widget buildCarosel() {
    return StreamBuilder<QuerySnapshot>(
      stream: backendGrafik.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          dataCovid =
              snapshot.data.docs.map((perItem) => perItem.data()).toList();
          print("datacovid : $dataCovid");
          kasus = {
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
          };

          for (var perItem in dataCovid) {
            if (perItem['keterangan'] == "PDP") {
              kasus['PDP']++;
            } else if (perItem['keterangan'] == "ODP") {
              kasus['ODP']++;
            } else if (perItem['keterangan'] == "OTG") {
              kasus['OTG']++;
            } else if (perItem['keterangan'] == "Jumlah ODP Selesai Pantau") {
              kasus['Jumlah ODP Selesai Pantau']++;
            } else if (perItem['keterangan'] == "Jumlah PDP Sehat") {
              kasus['Jumlah PDP Sehat']++;
            } else if (perItem['keterangan'] == "Jumlah Suspek") {
              kasus['Jumlah Suspek']++;
            } else if (perItem['keterangan'] == "Suspek Dirawat") {
              kasus['Suspek Dirawat']++;
            } else if (perItem['keterangan'] == "Suspek Isolasi Mandiri") {
              kasus['Suspek Isolasi Mandiri']++;
            } else if (perItem['keterangan'] == "Suspek Terkonfirmasi") {
              kasus['Suspek Terkonfirmasi']++;
            } else if (perItem['keterangan'] == "Discarded") {
              kasus["Discarded"]++;
            } else if (perItem['keterangan'] == "Suspek Meninggal/Probable") {
              kasus["Suspek Meninggal/Probable"]++;
            } else if (perItem['keterangan'] == "Jumlah Kasus Konfirmasi") {
              kasus["Jumlah Kasus Konfirmasi"]++;
            } else if (perItem['keterangan'] == "Konfirmasi Dirawat") {
              kasus["Konfirmasi Dirawat"]++;
            } else if (perItem['keterangan'] == "Konfirmasi Isolasi Mandiri") {
              kasus["Konfirmasi Isolasi Mandiri"]++;
            } else if (perItem['keterangan'] == "Konfirmasi Sembuh") {
              kasus["Konfirmasi Sembuh"]++;
            } else if (perItem['keterangan'] == "Konfirmasi Meninggal") {
              kasus["Konfirmasi Meninggal"]++;
            }
          }

          print("jumlah kasus : $kasus");
          //NOTE untuk boxcarousel
          return Container(
            height: 100,
            padding: const EdgeInsets.only(left: 5, right: 5),
            //box carousel
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Boxgrafik(
                  kasus: "Meninggal",
                  total: kasus['Konfirmasi Meninggal'] +
                      kasus['Suspek Meninggal/Probable'],
                  kotalKecil: kwarna_meninggal,
                  onBottonShow: () {
                    showModalBottomSheet<void>(
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (BuildContext context) {
                        return TabelBottomShow(
                          isiTabel: [
                            {
                              'kasus': 'Konfirmasi Meninggal',
                              'total': kasus['Konfirmasi Meninggal']
                            },
                            {
                              'kasus': 'Suspek Meninggal/Probable',
                              'total': kasus['Suspek Meninggal/Probable']
                            },
                          ],
                        );
                      },
                    );
                  },
                ),
                Boxgrafik(
                  kasus: "Positif",
                  total: kasus['Jumlah Kasus Konfirmasi'],
                  kotalKecil: kwarna_positif,
                  onBottonShow: () {
                    showModalBottomSheet<void>(
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (BuildContext context) {
                        return TabelBottomShow(
                          isiTabel: [
                            {
                              'kasus': 'Jumlah Kasus Konfirmasi',
                              'total': kasus['Jumlah Kasus Konfirmasi']
                            },
                          ],
                        );
                      },
                    );
                  },
                ),
                Boxgrafik(
                  kasus: "Sembuh",
                  total: kasus['Jumlah PDP Sehat'] +
                      kasus['Discarded'] +
                      kasus['Konfirmasi Sembuh'],
                  kotalKecil: kwarna_sembuh,
                  onBottonShow: () {
                    showModalBottomSheet<void>(
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (BuildContext context) {
                        return TabelBottomShow(
                          isiTabel: [
                            {
                              'kasus': 'Jumlah PDP Sehat',
                              'total': kasus['Jumlah PDP Sehat']
                            },
                            {'kasus': 'Discarded', 'total': kasus['Discarded']},
                            {
                              'kasus': 'Konfirmasi Sembuh',
                              'total': kasus['Konfirmasi Sembuh']
                            },
                          ],
                        );
                      },
                    );
                  },
                ),
                Boxgrafik(
                  kasus: "Dirawat",
                  total: kasus['Konfirmasi Dirawat'],
                  kotalKecil: kwarna_dirawat,
                  onBottonShow: () {
                    showModalBottomSheet<void>(
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (BuildContext context) {
                        return TabelBottomShow(
                          isiTabel: [
                            {
                              'kasus': 'Konfirmasi Dirawat',
                              'total': kasus['Konfirmasi Dirawat']
                            },
                          ],
                        );
                      },
                    );
                  },
                ),
                Boxgrafik(
                  kasus: "Tersuspek",
                  total: kasus['Jumlah Suspek'] +
                      kasus['Suspek Dirawat'] +
                      kasus['Suspek Isolasi Mandiri'] +
                      kasus['Suspek Terkonfirmasi'] +
                      kasus['Konfirmasi Isolasi Mandiri'] +
                      kasus['Jumlah ODP Selesai Pantau'],
                  kotalKecil: kwarna_tersuspect,
                  onBottonShow: () {
                    showModalBottomSheet<void>(
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (BuildContext context) {
                        return TabelBottomShow(
                          isiTabel: [
                            {
                              'kasus': 'Jumlah Suspek',
                              'total': kasus['Jumlah Suspek']
                            },
                            {
                              'kasus': 'Suspek Dirawat',
                              'total': kasus['Suspek Dirawat']
                            },
                            {
                              'kasus': 'Suspek Isolasi Mandiri',
                              'total': kasus['Suspek Isolasi Mandiri']
                            },
                            {
                              'kasus': 'Suspek Terkonfirmasi',
                              'total': kasus['Suspek Terkonfirmasi']
                            },
                            {
                              'kasus': 'Konfirmasi Isolasi Mandiri',
                              'total': kasus['Konfirmasi Isolasi Mandiri']
                            },
                            {
                              'kasus': 'Jumlah ODP Selesai Pantau',
                              'total': kasus['Jumlah ODP Selesai Pantau']
                            },
                          ],
                        );
                      },
                    );
                  },
                )
              ],
            ),
          );
        } else {
          return Center(
            child: SpinKitFadingFour(
              size: 30,
            ),
          );
        }
      },
    );
  }
}
