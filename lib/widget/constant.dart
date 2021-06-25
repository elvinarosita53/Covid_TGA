import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

//warna grafik garis
Color kwarna_meninggal = Colors.red;
Color kwarna_sembuh = Colors.blue;
Color kwarna_positif = Colors.yellow;
Color kwarna_dirawat = Colors.green;
Color kwarna_tersuspect = Colors.purple;

// warna carosel
LinearGradient kwarnagradien_meninggal = LinearGradient(
  begin: Alignment.center,
  end: Alignment.bottomCenter,
  colors: [
    Colors.green[100],
    Colors.teal[100],
  ],
);
LinearGradient kwarnagradien_sembuh = LinearGradient(
  begin: Alignment.center,
  end: Alignment.bottomCenter,
  colors: [
    Colors.lightBlue[200],
    Colors.indigo[100],
  ],
);
LinearGradient kwarnagradien_positif = LinearGradient(
  begin: Alignment.center,
  end: Alignment.bottomCenter,
  colors: [
    Colors.red[200],
    Colors.deepOrange[100],
  ],
);
LinearGradient kwarnagradien_dirawat = LinearGradient(
  begin: Alignment.center,
  end: Alignment.bottomCenter,
  colors: [
    Colors.deepOrange[200],
    Colors.yellow[100],
  ],
);
LinearGradient kwarnagradien_tersuspect = LinearGradient(
  begin: Alignment.center,
  end: Alignment.bottomCenter,
  colors: [
    Colors.yellow[200],
    Colors.lime[200],
  ],
);

// hitungan 1-100
var umurTahun = List.generate(100, (index) => index + 1);
var umurBulan = List.generate(11, (index) => index + 1);
List<String> kecamatan = [
  "Kecamatan Bate",
  "Kecamatan Delima",
  "Kecamatan Geumpang Pidie",
  "Kecamatan Geulumpang Tiga",
  "Kecamatan Glumpang Baro",
  "Kecamatan Grong-Grong",
  "Kecamatan Indra Jaya",
  "Kecamatan Kembang Tanjong",
  "Kecamatan Keumala",
  "Kecamatan Kota Sigli",
  "Kecamatan Mane",
  "Kecamatan Muara Tiga",
  "Kecamatan Mutiara",
  "Kecamatan Mutiara Timur",
  "Kecamatan Padang Tiji",
  "Kecamatan Peukan Baro",
  "Kecamatan Pidie",
  "Kecamatan Sakti",
  "Kecamatan Simpang Tiga",
  "Kecamatan Tangse",
  "Kecamatan Tiro",
  "Kecamatan Titeue",
];

List<String> keterangans = [
  "Jumlah OPD Selesai Pantau",
  "Jumlah PDP Sehat",
  "Jumlah Suspek",
  "Suspek Dirawat",
  "Suspek Isolasi Mandiri",
  "Suspek Terkonfirmasi",
  "Discarded",
  "Suspek Meninggal/Probable",
  "Jumlah Kasus Konfirmasi",
  "Konfirmasi Dirawat",
  "Konfirmasi Isolasi Mandiri",
  "Konfirmasi Sembuh",
  "Konfirmasi Meninggal"
];

Color primarycolor = Color(0xff0C253A);
Color textPrimaryColor = Color(0xff141f2b);
Color secondarycolor = Colors.blue[200];

/// warna ini untuk tulisan search
Color primarySearchColor = Colors.white.withOpacity(0.2);

String judulPanduan =
    "Berikut Penjelasan Setiap Kasus yang Terdefinsi dalam Kasus \nCOVID-19";

//untuk list panduang covid
List<Map> dataPanduan = [
  {'warna': Colors.orange, 'kasus': "KASUS SUSPEK"},
  {'warna': Colors.yellow, 'kasus': "KASUS PROBABLE"},
  {'warna': Colors.green, 'kasus': "KASUS KONFIRMASI"},
  {'warna': Colors.pink, 'kasus': "KONTAK ERAT"},
  {'warna': Colors.grey, 'kasus': "PELAKU PERJALANA"},
  {'warna': Colors.blueAccent, 'kasus': "DISCARDED"},
  {'warna': Colors.blue[900], 'kasus': "SELESAI ISOLASI"},
  {'warna': Colors.red, 'kasus': "KEMATIAN"},
];

SpinKitFadingFour loading = SpinKitFadingFour(
  color: primarycolor,
  size: 60,
);
