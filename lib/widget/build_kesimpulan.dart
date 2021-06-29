import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:menu_login/page/page_detailKesimpulan.dart';
import 'package:menu_login/widget/cardKesimpulan.dart';
import 'package:menu_login/widget/constant.dart';

class BuildKesimpulan extends StatelessWidget {
  Map<String, Map> kasusPerBulan = {};
  List dataTanggal = [];
  List<String> dataBulan = [];
  List dataCovid = [];
  Map<String, Map> kasusPerTahun = {};
  List dataKecamatan = [];
  List dataTahun = [];
  Map<String, Map> kasusPerKecamatan = {};
  CollectionReference backendKesimpulan =
      FirebaseFirestore.instance.collection('data_covid');

  @override
  Widget build(BuildContext context) {
    setAwalDataKecamatan();
    setAwalDataUsia();
    return GestureDetector(
      onTap: () {
        showModalBottomSheet<void>(
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(15),
              topLeft: Radius.circular(15),
            ),
          ),
          builder: (BuildContext context) {
            return Container(
              padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  topLeft: Radius.circular(15),
                ),
              ),
              child: StreamBuilder(
                stream: backendKesimpulan.snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    setAwalDataKecamatan();
                    setAwalDataUsia();

                    //NOTE ambil data d database
                    dataCovid = snapshot.data.docs
                        .map((perItem) => perItem.data())
                        .toList();

                    //data Kecamatan
                    dataKecamatan = dataCovid
                        .map((perKecamatan) => perKecamatan['kecamatan'])
                        .toList();
                    // NOTE diolah datany
                    // chek keterangan per kecamatan

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
                          filterKecamatan("Kecamatan Indra Jaya", dataCovid[i]);
                          break;
                        case "Kecamatan Kembang Tanjong":
                          filterKecamatan(
                              "Kecamatan Kembang Tanjong", dataCovid[i]);
                          break;
                        case "Kecamatan Keumala":
                          filterKecamatan("Kecamatan Keumala", dataCovid[i]);
                          break;
                        case "Kecamatan Kota Sigli":
                          filterKecamatan("Kecamatan Kota Sigli", dataCovid[i]);
                          break;
                        case "Kecamatan Mane":
                          filterKecamatan("Kecamatan Mane", dataCovid[i]);
                          break;
                        case "Kecamatan Mila":
                          filterKecamatan("Kecamatan Mila", dataCovid[i]);
                          break;
                        case "Kecamatan Muara Tiga":
                          filterKecamatan("Kecamatan Muara Tiga", dataCovid[i]);
                          break;
                        case "Kecamatan Mutiara":
                          filterKecamatan("Kecamatan Mutiara", dataCovid[i]);
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

                    // data Tahun
                    dataTahun =
                        dataCovid.map((perTahun) => perTahun['tahun']).toList();
                    for (var i = 0; i < dataTahun.length; i++) {
                      if (dataTahun[i] < 5 && dataTahun[i] >= 0) {
                        filterTahun("0-5", dataCovid[i]);
                      } else if (dataTahun[i] < 11 && dataTahun[i] >= 6) {
                        filterTahun("6-11", dataCovid[i]);
                      } else if (dataTahun[i] < 25 && dataTahun[i] >= 12) {
                        filterTahun("12-25", dataCovid[i]);
                      } else if (dataTahun[i] < 45 && dataTahun[i] >= 25) {
                        filterTahun("26-45", dataCovid[i]);
                      } else if (dataTahun[i] < 65 && dataTahun[i] >= 46) {
                        filterTahun("46-65", dataCovid[i]);
                      } else {
                        filterTahun("65-100", dataCovid[i]);
                      }
                    }
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

                    Map dataBaruUsia = {
                      "0-5": {},
                      "6-11": {},
                      "12-25": {},
                      "26-45": {},
                      "46-65": {},
                      "65-100": {},
                    };

                    String maxKecamatanPositif = '';
                    String maxKecamatanMeninggal = '';
                    String maxUsiaPositif = '';
                    String maxusiaMeninggal = '';
                    int maxMeninggal = 0;
                    int maxPositif = 0;
                    int usiaPositif = 0;
                    int usiaMeninggal = 0;

                    kasusPerKecamatan.forEach((key, value) {
                      // untuk data positif tertinggi
                      dataBaruKecamatan[key]['positif'] =
                          value['Jumlah Kasus Konfirmasi'];
                      if (maxPositif < dataBaruKecamatan[key]['positif']) {
                        maxPositif = dataBaruKecamatan[key]['positif'];
                        maxKecamatanPositif = key;
                      }
                      // untuk data meninggal tertinggi
                      dataBaruKecamatan[key]['meninggal'] =
                          value['Konfirmasi Meninggal'] +
                              value['Suspek Meninggal/Probable'];

                      if (maxMeninggal < dataBaruKecamatan[key]['meninggal']) {
                        maxMeninggal = dataBaruKecamatan[key]['meninggal'];
                        maxKecamatanMeninggal = key;
                      }
                    });

                    // ini untuk pengolahan data usia positf dan meninggal
                    kasusPerTahun.forEach(
                      (key, value) {
                        // untuk data meninggal tertinggi berdasarkan usia
                        dataBaruUsia[key]['meninggal'] =
                            value['Konfirmasi Meninggal'] +
                                value['Suspek Meninggal/Probable'];

                        if (usiaMeninggal < dataBaruUsia[key]['meninggal']) {
                          usiaMeninggal = dataBaruUsia[key]['meninggal'];
                          maxusiaMeninggal = key;
                        }

                        // untuk data positif tertinggi berdasarkan usia
                        dataBaruUsia[key]['positif'] =
                            value['Jumlah Kasus Konfirmasi'];

                        if (usiaPositif < dataBaruUsia[key]['positif']) {
                          usiaPositif = dataBaruUsia[key]['positif'];
                          maxUsiaPositif = key;
                        }
                      },
                    );
//NOTE start bulan
                    setAwalDataKasus();
                    // NOTE ambil data d database
                    dataCovid = snapshot.data.docs
                        .map((perItem) => perItem.data())
                        .toList();
                    print('dataCovid : $dataCovid');

                    dataTanggal =
                        dataCovid.map((e) => e['tgl awal gejala']).toList();

                    // print('dataTAngga : $dataTanggal');

                    dataBulan = dataTanggal.map((perItem) {
                      if (perItem != null) {
                        DateTime perBulan = DateFormat.yMd('id').parse(perItem);
                        String bulanPerdata = DateFormat.M().format(perBulan);
                        return bulanPerdata;
                      }

                      //ambil data bulannya aja
                    }).toList();
                    // print("databulan = $dataBulan");

                    // NOTE diolah datanya
                    // chek ketranga per bulan

                    for (var i = 0; i < dataBulan.length; i++) {
                      switch (dataBulan[i]) {
                        case '1':
                          filterKeterangan('januari', dataCovid[i]);
                          break;
                        case '2':
                          filterKeterangan('februari', dataCovid[i]);
                          break;
                        case '3':
                          filterKeterangan('maret', dataCovid[i]);
                          break;
                        case '4':
                          filterKeterangan('april', dataCovid[i]);
                          break;
                        case '5':
                          filterKeterangan('mei', dataCovid[i]);
                          break;
                        case '6':
                          filterKeterangan('juni', dataCovid[i]);
                          break;
                        case '7':
                          filterKeterangan('juli', dataCovid[i]);
                          break;
                        case '8':
                          filterKeterangan('agustus', dataCovid[i]);
                          break;
                        case '9':
                          filterKeterangan('september', dataCovid[i]);
                          break;
                        case '10':
                          filterKeterangan('oktober', dataCovid[i]);
                          break;
                        case '11':
                          filterKeterangan('november', dataCovid[i]);
                          break;
                        case '12':
                          filterKeterangan('desember', dataCovid[i]);
                          break;
                        default:
                      }
                    }

                    // print("kasus perbulan : $kasusPerBulan");

                    Map dataBaru = {
                      'januari': {},
                      'februari': {},
                      'maret': {},
                      'april': {},
                      'mei': {},
                      'juni': {},
                      'juli': {},
                      'agustus': {},
                      'september': {},
                      'oktober': {},
                      'november': {},
                      'desember': {},
                    };
                    // forEach itu untuk akses stiap data pada data map.
                    double max = 0;
                    kasusPerBulan.forEach((key, value) {
                      print("key : $key");
                      print("value : $value");
                      // data['asdfasdf'] = 2;

                      dataBaru[key]['positif'] =
                          value['Jumlah Kasus Konfirmasi'];

                      dataBaru[key]['sembuh'] = value['Jumlah PDP Sehat'] +
                          value['Discarded'] +
                          value['Konfirmasi Sembuh'];
                      dataBaru[key]['meninggal'] =
                          value['Konfirmasi Meninggal'] +
                              value['Suspek Meninggal/Probable'];
                      dataBaru[key]['dirawat'] = value['Konfirmasi Dirawat'];

                      dataBaru[key]['tersuspek'] = value['Jumlah Suspek'] +
                          value['Suspek Dirawat'] +
                          value['Suspek Isolasi Mandiri'] +
                          value['Suspek Terkonfirmasi'] +
                          value['Konfirmasi Isolasi Mandiri'] +
                          value['Jumlah ODP Selesai Pantau'];

                      if (max < dataBaru[key]['positif']) {
                        max = dataBaru[key]['positif'].toDouble();
                      }
                      if (max < dataBaru[key]['sembuh']) {
                        max = dataBaru[key]['sembuh'].toDouble();
                      }
                      if (max < dataBaru[key]['meninggal']) {
                        max = dataBaru[key]['meninggal'].toDouble();
                      }
                      if (max < dataBaru[key]['dirawat']) {
                        max = dataBaru[key]['dirawat'].toDouble();
                      }
                      if (max < dataBaru[key]['tersuspek']) {
                        max = dataBaru[key]['tersuspek'].toDouble();
                      }
                    });
                    print("kasus bulan $dataBaru");
                    //NOTE nilai rata-rata
                    Map<String, double> rataRata = {
                      'positif': 0.0,
                      'sembuh': 0.0,
                      'meninggal': 0.0,
                      'dirawat': 0.0,
                      'tersuspek': 0.0,
                    };

                    dataBaru.forEach((key, value) {
                      rataRata['positif'] =
                          (rataRata['positif'] + value['positif']) / 12;
                      rataRata['sembuh'] =
                          (rataRata['sembuh'] + value['sembuh']) / 12;
                      rataRata['meninggal'] =
                          (rataRata['meninggal'] + value['meninggal']) / 12;
                      rataRata['dirawat'] =
                          (rataRata['dirawat'] + value['dirawat']) / 12;
                      rataRata['tersuspek'] =
                          (rataRata['tersuspek'] + value['tersuspek']) / 12;
                    });

                    // NOTE nilai Standart deviasi
                    Map<String, double> varianKasus = {
                      'positif': 0.0,
                      'sembuh': 0.0,
                      'meninggal': 0.0,
                      'dirawat': 0.0,
                      'tersuspek': 0.0,
                    };
                    dataBaru.forEach((key, value) {
                      varianKasus['positif'] = varianKasus['positif'] +
                          pow((value['positif'] - rataRata['positif']), 2) / 11;
                      varianKasus['sembuh'] = varianKasus['sembuh'] +
                          pow((value['sembuh'] - rataRata['sembuh']), 2) / 11;
                      varianKasus['meninggal'] = varianKasus['meninggal'] +
                          pow((value['meninggal'] - rataRata['meninggal']), 2) /
                              11;
                      varianKasus['dirawat'] = varianKasus['dirawat'] +
                          pow((value['dirawat'] - rataRata['dirawat']), 2) / 11;
                      varianKasus['tersuspek'] = varianKasus['tersuspek'] +
                          pow((value['tersuspek'] - rataRata['tersuspek']), 2) /
                              11;
                    });
//NOTE end bulan
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(vertical: 10),
                            width: MediaQuery.of(context).size.width,
                            color: primarycolor,
                            child: Text(
                              "Kesimpulan Grafik",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          CardKesimpulan(
                            judulTextKesimpulan: "Meninggal Terbanyak:",
                            kesimpulanKasus: maxKecamatanMeninggal,
                            total: maxMeninggal,
                          ),
                          CardKesimpulan(
                            judulTextKesimpulan: "Positif Tertinggi:",
                            kesimpulanKasus: maxKecamatanPositif,
                            total: maxPositif,
                          ),
                          CardKesimpulan(
                            judulTextKesimpulan: " Usia Rentan Positif:",
                            kesimpulanKasus: 'Usia $maxUsiaPositif Tahun',
                          ),
                          CardKesimpulan(
                            judulTextKesimpulan: "Usia Yang Rentan Meninggal:",
                            kesimpulanKasus: 'Usia $maxusiaMeninggal Tahun',
                          ),
                          // IconButton(
                          //   padding: EdgeInsets.all(0),
                          //   onPressed: () {
                          //     Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //         builder: (context) => PageDetailKesimpulan(
                          //           maxKecamatanMeninggal:
                          //               maxKecamatanMeninggal,
                          //           maxMeninggal: maxMeninggal,
                          //           maxKecamatanPositif: maxKecamatanPositif,
                          //           maxPositif: maxPositif,
                          //           maxUsiaPositif: maxUsiaPositif,
                          //           maxusiaMeninggal: maxusiaMeninggal,
                          //           rataRata: rataRata,
                          //           varianKasus: varianKasus,
                          //         ),
                          //       ),
                          //     );
                          //   },
                          //   icon: Icon(
                          //     Icons.expand_more,
                          //     color: primarycolor,
                          //   ),
                          //   iconSize: 30,
                          // )
                        ],
                      ),
                    );
                  } else {
                    return SpinKitFadingFour(
                      size: 30,
                      color: primarycolor,
                    );
                  }
                },
              ),
            );
          },
        );
      },
      child: Center(
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 15),
          height: 55,
          decoration: BoxDecoration(
              color: primarycolor, borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.grading_sharp,
                size: 20,
                color: Colors.white,
              ),
              Text(
                "Kesimpulan Grafik",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
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

  //metode untuk seting data kasus agar penambahannya kembali ke awal
  void setAwalDataUsia() {
    kasusPerTahun = {
      "0-5": {
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
      "6-11": {
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
      "12-25": {
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
      "26-45": {
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
      "46-65": {
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
      "65-100": {
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

  //metod untuk filter Tahun/umur saat penambahan data berdasarkan keterangan kasus
  void filterTahun(String tahun, Map perItem) {
    if (perItem['keterangan'] == "PDP") {
      kasusPerTahun[tahun]['PDP']++;
      //
    } else if (perItem['keterangan'] == "ODP") {
      kasusPerTahun[tahun]['ODP']++;
    } else if (perItem['keterangan'] == "OTG") {
      kasusPerTahun[tahun]['OTG']++;
      //
    } else if (perItem['keterangan'] == "Jumlah ODP Selesai Pantau") {
      kasusPerTahun[tahun]['Jumlah ODP Selesai Pantau']++;
      //
    } else if (perItem['keterangan'] == "Jumlah PDP Sehat") {
      kasusPerTahun[tahun]['Jumlah PDP Sehat']++;
      //
    } else if (perItem['keterangan'] == "Jumlah Suspek") {
      kasusPerTahun[tahun]['Jumlah Suspek']++;
      //
    } else if (perItem['keterangan'] == "Suspek Dirawat") {
      kasusPerTahun[tahun]['Suspek Dirawat']++;
      //
    } else if (perItem['keterangan'] == "Suspek Isolasi Mandiri") {
      kasusPerTahun[tahun]['Suspek Isolasi Mandiri']++;
      //
    } else if (perItem['keterangan'] == "Suspek Terkonfirmasi") {
      kasusPerTahun[tahun]['Suspek Terkonfirmasi']++;
      //
    } else if (perItem['keterangan'] == "Discarded") {
      kasusPerTahun[tahun]["Discarded"]++;
      //
    } else if (perItem['keterangan'] == "Suspek Meninggal/Probable") {
      kasusPerTahun[tahun]["Suspek Meninggal/Probable"]++;
      //
    } else if (perItem['keterangan'] == "Jumlah Kasus Konfirmasi") {
      kasusPerTahun[tahun]["Jumlah Kasus Konfirmasi"]++;
      //
    } else if (perItem['keterangan'] == "Konfirmasi Dirawat") {
      kasusPerTahun[tahun]["Konfirmasi Dirawat"]++;
      //
    } else if (perItem['keterangan'] == "Konfirmasi Isolasi Mandiri") {
      kasusPerTahun[tahun]["Konfirmasi Isolasi Mandiri"]++;
      //
    } else if (perItem['keterangan'] == "Konfirmasi Sembuh") {
      kasusPerTahun[tahun]["Konfirmasi Sembuh"]++;
      //
    } else if (perItem['keterangan'] == "Konfirmasi Meninggal") {
      kasusPerTahun[tahun]["Konfirmasi Meninggal"]++;
    }
  }

  //metod untuk filter keterangan saat penambahan data berdasarkan keterangan kasus
  void filterKeterangan(String bulan, Map perItem) {
    if (perItem['keterangan'] == "PDP") {
      kasusPerBulan[bulan]['PDP']++;
      //
    } else if (perItem['keterangan'] == "ODP") {
      kasusPerBulan[bulan]['ODP']++;
      //
    } else if (perItem['keterangan'] == "OTG") {
      kasusPerBulan[bulan]['OTG']++;
      //
    } else if (perItem['keterangan'] == "Jumlah ODP Selesai Pantau") {
      kasusPerBulan[bulan]['Jumlah ODP Selesai Pantau']++;
      //
    } else if (perItem['keterangan'] == "Jumlah PDP Sehat") {
      kasusPerBulan[bulan]['Jumlah PDP Sehat']++;
      //
    } else if (perItem['keterangan'] == "Jumlah Suspek") {
      kasusPerBulan[bulan]['Jumlah Suspek']++;
      //
    } else if (perItem['keterangan'] == "Suspek Dirawat") {
      kasusPerBulan[bulan]['Suspek Dirawat']++;
      //
    } else if (perItem['keterangan'] == "Suspek Isolasi Mandiri") {
      kasusPerBulan[bulan]['Suspek Isolasi Mandiri']++;
      //
    } else if (perItem['keterangan'] == "Suspek Terkonfirmasi") {
      kasusPerBulan[bulan]['Suspek Terkonfirmasi']++;
      //
    } else if (perItem['keterangan'] == "Discarded") {
      kasusPerBulan[bulan]["Discarded"]++;
      //
    } else if (perItem['keterangan'] == "Suspek Meninggal/Probable") {
      kasusPerBulan[bulan]["Suspek Meninggal/Probable"]++;
      //
    } else if (perItem['keterangan'] == "Jumlah Kasus Konfirmasi") {
      kasusPerBulan[bulan]["Jumlah Kasus Konfirmasi"]++;
      //
    } else if (perItem['keterangan'] == "Konfirmasi Dirawat") {
      kasusPerBulan[bulan]["Konfirmasi Dirawat"]++;
      //
    } else if (perItem['keterangan'] == "Konfirmasi Isolasi Mandiri") {
      kasusPerBulan[bulan]["Konfirmasi Isolasi Mandiri"]++;
      //
    } else if (perItem['keterangan'] == "Konfirmasi Sembuh") {
      kasusPerBulan[bulan]["Konfirmasi Sembuh"]++;
      //
    } else if (perItem['keterangan'] == "Konfirmasi Meninggal") {
      kasusPerBulan[bulan]["Konfirmasi Meninggal"]++;
    }
  }

//metode untuk seting data kasus agar penambahannya kembali ke awal
  void setAwalDataKasus() {
    kasusPerBulan = {
      'januari': {
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
      'februari': {
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
      'maret': {
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
      'april': {
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
      'mei': {
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
      'juni': {
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
      'juli': {
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
      'agustus': {
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
      'september': {
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
      'oktober': {
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
      'november': {
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
      'desember': {
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
}
