import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:menu_login/widget/constant.dart';

class BuildChart extends StatelessWidget {
  final String currentKecamatan;
  BuildChart({this.currentKecamatan});

  List dataTanggal = [];
  List<String> dataBulan = [];
  List dataCovid = [];
  CollectionReference backendLineBar =
      FirebaseFirestore.instance.collection('data_covid');

  LineChartBarData grafikSembuh;
  LineChartBarData grafikDirawat;
  LineChartBarData grafikMeninggal;
  LineChartBarData grafikPositif;
  LineChartBarData grafikTersuspek;
  Map<String, Map> kasusPerBulan;

  @override
  Widget build(BuildContext context) {
    setAwalDataKasus();
    return Container(
      height: MediaQuery.of(context).size.height / 2.3,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: StreamBuilder<QuerySnapshot>(
          stream: (currentKecamatan != null)
              ? backendLineBar
                  .where('kecamatan', isEqualTo: currentKecamatan)
                  .snapshots()
              : backendLineBar.snapshots(),
          builder: (context, snapshot) {
            // NOTE cheek ada snpashot atau tidak
            if (snapshot.hasData) {
              setAwalDataKasus();
              // NOTE ambil data d database
              dataCovid =
                  snapshot.data.docs.map((perItem) => perItem.data()).toList();
              print('dataCovid : $dataCovid');

              dataTanggal = dataCovid.map((e) => e['tgl awal gejala']).toList();

              // print('dataTAngga : $dataTanggal');

              dataBulan = dataTanggal.map((perItem) {
                if (perItem != null) {
                  DateTime perBulan = DateFormat.yMd('id').parse(perItem);
                  String bulanPerdata = DateFormat.M().format(perBulan);
                  return bulanPerdata;
                }
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

                dataBaru[key]['positif'] = value['Jumlah Kasus Konfirmasi'];

                dataBaru[key]['sembuh'] = value['Jumlah PDP Sehat'] +
                    value['Discarded'] +
                    value['Konfirmasi Sembuh'];
                dataBaru[key]['meninggal'] = value['Konfirmasi Meninggal'] +
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

              print("data akhir : $dataBaru");
              grafikSembuh = lineChartBarData(
                lineBarData: getLineBarData('sembuh', dataBaru),
                warna: [kwarna_sembuh],
              );
              grafikMeninggal = lineChartBarData(
                lineBarData: getLineBarData('meninggal', dataBaru),
                warna: [kwarna_meninggal],
              );
              grafikTersuspek = lineChartBarData(
                lineBarData: getLineBarData('tersuspek', dataBaru),
                warna: [kwarna_tersuspect],
              );
              grafikDirawat = lineChartBarData(
                lineBarData: getLineBarData('dirawat', dataBaru),
                warna: [kwarna_dirawat],
              );
              grafikPositif = lineChartBarData(
                lineBarData: getLineBarData('positif', dataBaru),
                warna: [kwarna_positif],
              );

              return LineChart(
                mainData(maxY: (max < 10) ? 6 : max + 3),
              );
              // return Text("ada data");
            } else {
              return loading;
            }
          },
        ),
      ),
    );
  }

  getLineBarData(String keterangan, Map dataBaru) {
    return [
      FlSpot(1, dataBaru['januari'][keterangan].toDouble()),
      FlSpot(2, dataBaru['februari'][keterangan].toDouble()),
      FlSpot(3, dataBaru['maret'][keterangan].toDouble()),
      FlSpot(4, dataBaru['april'][keterangan].toDouble()),
      FlSpot(5, dataBaru['mei'][keterangan].toDouble()),
      FlSpot(6, dataBaru['juni'][keterangan].toDouble()),
      FlSpot(7, dataBaru['juli'][keterangan].toDouble()),
      FlSpot(8, dataBaru['agustus'][keterangan].toDouble()),
      FlSpot(9, dataBaru['september'][keterangan].toDouble()),
      FlSpot(10, dataBaru['oktober'][keterangan].toDouble()),
      FlSpot(11, dataBaru['november'][keterangan].toDouble()),
      FlSpot(12, dataBaru['desember'][keterangan].toDouble()),
    ];
  }

  LineChartData mainData({@required double maxY}) {
    return LineChartData(
      //NOTE Grafik Size
      //nilai maksimal sumbu x dan sumbu y
      minX: 0,
      maxX: 13,
      minY: 0,
      maxY: maxY,

      //NOTE data yang akan di tampilkan
      lineBarsData: [
        // LineChartBarData menghasilkan 1 line chart
        grafikSembuh,
        grafikDirawat,
        grafikMeninggal,
        grafikPositif,
        grafikTersuspek,
      ],

      // NOTE design background  membuat garis pada background grafik
      gridData: FlGridData(
        show: true,
        //NOTE design garis background Horizontal
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: Colors.grey.withOpacity(0.2), //warna garis
            strokeWidth: 1, //ketebalan garis
            // dashArray: [5, 10], // 5px panjang garis, 10px spasi
          );
        },

        //NOTE design garis Vertikal
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),

      //NOTE Judul Pada Grafik
      titlesData: FlTitlesData(
        topTitles: SideTitles(
          showTitles: false,
          // reservedSize: 50, // ?

          margin: 10, // spasi tulisan dengan grafik
          getTextStyles: (value) => const TextStyle(
            //ubah style tulisan
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          getTitles: (value) {
            //karena pada properti minX dan maxX sudah kita deklarasikan sebesar 0 dan 12
            switch (value.toInt()) {
              //ubah nama text sumbu x sesuai keinginan
              case 2:
                return 'Daily News Case';
            }
            return '';
          },
        ),
        show: true,
        //NOTE keterangan sumbu x
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 5, // ?
          rotateAngle: 0, //putar tulisan 300 derajat
          margin: 8, // spasi tulisan dengan grafik
          getTextStyles: (value) => const TextStyle(
            //ubah style tulisan
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          getTitles: (value) {
            //karena pada properti minX dan maxX sudah kita deklarasikan sebesar 0 dan 12
            switch (value.toInt()) {
              //ubah nama text sumbu x sesuai keinginan
              case 1:
                return 'JAN';

              case 6:
                return 'JUL';

              case 12:
                return 'DES';
            }
            return '';
          },
        ),

        // teks pada sumbu y
        leftTitles: SideTitles(
          showTitles: false,
          reservedSize: 30,
          rotateAngle: 0,
          getTextStyles: (value) => const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '100';
              case 5:
                return '500';
              case 10:
                return '1000';
            }
            return '';
          },
          // reservedSize: 28,
          margin: 5,
        ),
      ),

      // NOTE Design Kotak Grafik
      borderData: FlBorderData(
        show: false,
        border: Border.all(color: const Color(0xff37434d), width: 1),
      ),
    );
  }

  //NOTE line bar data dekorasi
  LineChartBarData lineChartBarData(
      {@required List<FlSpot> lineBarData, @required List<Color> warna}) {
    return LineChartBarData(
      spots: lineBarData,

//NOTE Design Line Chart
// true => grafik lengkung, false => grafik bersudut
      isCurved: true,

//atur warna line chart
      colors: warna,
      barWidth: 2, // ketebalan garis
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
    );
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
}
