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
List<String> Kecamatan = [
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
  "JUMLAH OPD SELESAI PANTAU",
  "JUMLAH PDP SEHAT",
  "JUMLAH SUSPEK",
  "SUSPEK DIRAWAT",
  "SUSPEK ISOLASI MANDIRI",
  "SUSPEK TERKONFIRMASI",
  "DISCARDED",
  "SUSPEK MENINGGAL/PROBABEL",
  "JUMLAH KASUS KONFIRMASI",
  "KONFIRMASI DIRAWAT",
  "KONFIRMASI ISOLASI MANDIRI",
  "KONFORMASI SEMBUH",
  "KONFORMASI MENINGGAL"
];

Color primarycolor = Colors.blue[900];
Color textPrimaeyColor = Colors.blue[700];

/// warna ini untuk tulisan search
Color primarySearchColor = Colors.white.withOpacity(0.2);

String judulPanduan =
    "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maiores tempora reprehenderit debitis quo culpa nesciunt est aut, vitae quos voluptas?";

//untuk list panduang covid
List<Map> dataPanduan = [
  {'warna': Colors.orange, 'kasus': "Kasus Suspek", 'penjelasan': ""},
  {'warna': Colors.yellow, 'kasus': "Kasus Probable"},
  {'warna': Colors.green, 'kasus': "Kasus Konfirmasi"},
  {'warna': Colors.pink, 'kasus': "Kasus Erat"},
  {'warna': Colors.grey, 'kasus': "Pelaku Perjalan"},
  {'warna': Colors.blueAccent, 'kasus': "Discarded"},
  {'warna': Colors.blue[900], 'kasus': "Selesai Isolasi"},
  {'warna': Colors.red, 'kasus': "Kematian"},
];

SpinKitFadingFour loading = SpinKitFadingFour(
  color: primarycolor,
  size: 60,
);
