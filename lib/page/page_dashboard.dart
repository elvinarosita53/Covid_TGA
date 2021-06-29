import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:menu_login/model/kecamatans.dart';
import 'package:menu_login/model/tabel.dart';
import 'package:menu_login/pdf_api.dart';
import 'package:menu_login/widget/boxGrafik.dart';
import 'package:menu_login/widget/build_chart.dart';
import 'package:menu_login/widget/build_kesimpulan.dart';
import 'package:menu_login/widget/cardKesimpulan.dart';
import 'package:menu_login/widget/constant.dart';
import 'package:menu_login/template/template.dart';
import 'package:menu_login/widget/customButton.dart';
import 'package:menu_login/widget/tabelBottomShow.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class PageDashboard extends StatefulWidget {
  @override
  _PageDashboardState createState() => _PageDashboardState();
}

class _PageDashboardState extends State<PageDashboard> {
  List dataKecamatan;
  Map<String, Map> kasusPerKecamatan;
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
  Map<String, Map<String, int>> ketPerKec = {};
  CollectionReference backendGrafik =
      FirebaseFirestore.instance.collection('data_covid');
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Template(
        body: ListView(
          children: (currentKecamatan == null)
              ? [
                  searchBox(context),
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: EdgeInsets.all(15),
                    child: BuildChart(
                      currentKecamatan: currentKecamatan,
                    ),
                  ),
                  buildCarosel(),

                  //NOTE untuk botton kesimpulan grafik
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: BuildKesimpulan(),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: CustomButton(
                            onTapPdf: () async {
                              setAwalDataKecamatan();
                              var result = await backendGrafik.get();

                              // //NOTE ambil data d database
                              dataCovid = result.docs
                                  .map((perItem) => perItem.data())
                                  .toList();

                              // //data Kecamatan
                              dataKecamatan = dataCovid
                                  .map((perKecamatan) =>
                                      perKecamatan['kecamatan'])
                                  .toList();
                              // print("data kecamata $dataKecamatan");
                              // // NOTE diolah datany
                              // // chek keterangan per kecamatan

                              for (var i = 0; i < dataKecamatan.length; i++) {
                                switch (dataKecamatan[i]) {
                                  case 'Kecamatan Bate':
                                    filterKecamatan(
                                        'Kecamatan Bate', dataCovid[i]);
                                    break;
                                  case "Kecamatan Delima":
                                    filterKecamatan(
                                        "Kecamatan Delima", dataCovid[i]);
                                    break;
                                  case "Kecamatan Geumpang Pidie":
                                    filterKecamatan("Kecamatan Geumpang Pidie",
                                        dataCovid[i]);
                                    break;
                                  case "Kecamatan Geulumpang Tiga":
                                    filterKecamatan("Kecamatan Geulumpang Tiga",
                                        dataCovid[i]);
                                    break;
                                  case "Kecamatan Glumpang Baro":
                                    filterKecamatan("Kecamatan Glumpang Baro",
                                        dataCovid[i]);
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
                                    filterKecamatan("Kecamatan Kembang Tanjong",
                                        dataCovid[i]);
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
                                    filterKecamatan(
                                        "Kecamatan Mane", dataCovid[i]);
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
                                    filterKecamatan("Kecamatan Mutiara Timur",
                                        dataCovid[i]);
                                    break;
                                  case "Kecamatan Padang Tiji":
                                    filterKecamatan(
                                        "Kecamatan Padang Tiji", dataCovid[i]);
                                    break;
                                  case 'kecamatan Bate':
                                    filterKecamatan(
                                        'kecamatan Bate', dataCovid[i]);
                                    break;
                                  case "Kecamatan Peukan Baro":
                                    filterKecamatan(
                                        "Kecamatan Peukan Baro", dataCovid[i]);
                                    break;
                                  case "Kecamatan Pidie":
                                    filterKecamatan(
                                        "Kecamatan Pidie", dataCovid[i]);
                                    break;
                                  case "Kecamatan Sakti":
                                    filterKecamatan(
                                        "Kecamatan Sakti", dataCovid[i]);
                                    break;
                                  case "Kecamatan Simpang Tiga":
                                    filterKecamatan(
                                        "Kecamatan Simpang Tiga", dataCovid[i]);
                                    break;
                                  case "Kecamatan Tangse":
                                    filterKecamatan(
                                        "Kecamatan Tangse", dataCovid[i]);
                                    break;
                                  case "Kecamatan Tiro":
                                    filterKecamatan(
                                        "Kecamatan Tiro", dataCovid[i]);
                                    break;

                                  case "Kecamatan Titeue":
                                    filterKecamatan(
                                        "Kecamatan Titeue", dataCovid[i]);
                                    break;
                                }
                              }

                              Map<String, Map> dataBaruKecamatan = {
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
                                "Kecamatan Mila": {},
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

                              String maxKecamatanPositif = '';
                              String maxKecamatanMeninggal = '';
                              String maxUsiaPositif = '';
                              String maxusiaMeninggal = '';
                              int maxMeninggal = 0;
                              int maxPositif = 0;
                              int usiaPositif = 0;
                              int usiaMeninggal = 0;

                              kasusPerKecamatan.forEach(
                                (key, value) {
                                  //     // untuk data positif tertinggi
                                  dataBaruKecamatan[key]['positif'] =
                                      value['Jumlah Kasus Konfirmasi'];
                                  if (maxPositif <
                                      dataBaruKecamatan[key]['positif']) {
                                    maxPositif =
                                        dataBaruKecamatan[key]['positif'];
                                    maxKecamatanPositif = key;
                                  }
                                  // untuk data meninggal tertinggi
                                  dataBaruKecamatan[key]['meninggal'] =
                                      value['Konfirmasi Meninggal'] +
                                          value['Suspek Meninggal/Probable'];

                                  if (maxMeninggal <
                                      dataBaruKecamatan[key]['meninggal']) {
                                    maxMeninggal =
                                        dataBaruKecamatan[key]['meninggal'];
                                    maxKecamatanMeninggal = key;
                                  }
                                },
                              );

                              ketPerKec = {
                                "Jumlah OPD Selesai Pantau": {},
                                "Jumlah PDP Sehat": {},
                                "Jumlah Suspek": {},
                                "Suspek Dirawat": {},
                                "Suspek Isolasi Mandiri": {},
                                "Suspek Terkonfirmasi": {},
                                "Discarded": {},
                                "Suspek Meninggal/Probable": {},
                                "Jumlah Kasus Konfirmasi": {},
                                "Konfirmasi Dirawat": {},
                                "Konfirmasi Isolasi Mandiri": {},
                                "Konfirmasi Sembuh": {},
                                "Konfirmasi Meninggal": {},
                              };

                              for (int i = 0; i < keterangans.length; i++) {
                                for (int j = 0; j < kecamatan.length; j++) {
                                  ketPerKec[keterangans[i]][kecamatan[j]] =
                                      (kasusPerKecamatan[kecamatan[j]]
                                                  [keterangans[i]] ==
                                              null)
                                          ? 0
                                          : kasusPerKecamatan[kecamatan[j]]
                                              [keterangans[i]];
                                }
                              }
                              print("data : $ketPerKec");
                              // Tabel tabel = Tabel(items: items)
                              List<TabelItem> dataTabel = [];
                              ketPerKec.forEach(
                                (keterangan, kecValue) {
                                  dataTabel.add(
                                    TabelItem(
                                      keterangan: keterangan,
                                      kecamatans: Kecamatans(
                                        bate: kecValue['Kecamatan Bate'] ?? 0,
                                        delima:
                                            kecValue['Kecamatan Delima'] ?? 0,
                                        geumpangPidie: kecValue[
                                                'Kecamatan Geumpang Pidie",'] ??
                                            0,
                                        geulumpangTiga: kecValue[
                                                'Kecamatan Geulumpang Tiga'] ??
                                            0,
                                        glumpangBaro: kecValue[
                                                'Kecamatan Glumpang Baro'] ??
                                            0,
                                        grongGrong:
                                            kecValue['Kecamatan Grong-Grong'] ??
                                                0,
                                        indraJaya:
                                            kecValue['Kecamatan Indra Jaya'] ??
                                                0,
                                        kembangTanjong: kecValue[
                                                'Kecamatan Kembang Tanjong'] ??
                                            0,
                                        keumala:
                                            kecValue['Kecamatan Keumala'] ?? 0,
                                        kotaSigli:
                                            kecValue['Kecamatan Kota Sigli'] ??
                                                0,
                                        mane: kecValue['Kecamatan Mane'] ?? 0,
                                        mila: kecValue['Kecamatan Mila'] ?? 0,
                                        muaraTiga:
                                            kecValue['Kecamatan Muara Tiga'] ??
                                                0,
                                        mutiara:
                                            kecValue['Kecamatan Mutiara'] ?? 0,
                                        mutiaraTimur: kecValue[
                                                'Kecamatan Mutiara Timur'] ??
                                            0,
                                        padangTiji:
                                            kecValue['Kecamatan Padang Tiji'] ??
                                                0,
                                        peukanBaro:
                                            kecValue['Kecamatan Peukan Baro'] ??
                                                0,
                                        pidie: kecValue['Kecamatan Pidie'] ?? 0,
                                        sakti: kecValue['Kecamatan Sakti'] ?? 0,
                                        simpangTiga: kecValue[
                                                'Kecamatan Simpang Tiga'] ??
                                            0,
                                        tangse:
                                            kecValue['Kecamatan Tangse'] ?? 0,
                                        tiro: kecValue['Kecamatan Tiro'] ?? 0,
                                        titeue:
                                            kecValue['Kecamatan Titeue'] ?? 0,
                                      ),
                                    ),
                                  );
                                },
                              );
                              Tabel tabel = Tabel(items: dataTabel);

                              setState(() {
                                isLoading = true;
                              });

                              final pdfFile = await PdfApi.generateFile(tabel);
                              setState(() {
                                isLoading = false;
                              });
                              PdfApi.openFile(pdfFile);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ]
              : [
                  searchBox(context),
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: EdgeInsets.all(15),
                    child: BuildChart(
                      currentKecamatan: currentKecamatan,
                    ),
                  ),
                  buildCarosel(),
                ],
        ),
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
          items: kecamatan,

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
      stream: (currentKecamatan != null)
          ? backendGrafik
              .where('kecamatan', isEqualTo: currentKecamatan)
              .snapshots()
          : backendGrafik.snapshots(),
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
              color: primarycolor,
            ),
          );
        }
      },
    );
  }

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
      "Kecamatan Mila": {
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
