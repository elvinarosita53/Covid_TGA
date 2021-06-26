import 'package:flutter/material.dart';
import 'package:menu_login/widget/cardKesimpulan.dart';
import 'package:menu_login/widget/constant.dart';

class PageDetailKesimpulan extends StatelessWidget {
  final String maxKecamatanPositif;
  final String maxKecamatanMeninggal;
  final String maxUsiaPositif;
  final String maxusiaMeninggal;
  final int maxMeninggal;
  final int maxPositif;
  final int usiaPositif;
  final int usiaMeninggal;
  final Map<String, double> rataRata = {
    'positif': 0.0,
    'sembuh': 0.0,
    'meninggal': 0.0,
    'dirawat': 0.0,
    'tersuspek': 0.0,
  };
  final Map<String, double> varianKasus = {
    'positif': 0.0,
    'sembuh': 0.0,
    'meninggal': 0.0,
    'dirawat': 0.0,
    'tersuspek': 0.0,
  };

  PageDetailKesimpulan(
      {this.maxKecamatanPositif,
      this.maxKecamatanMeninggal,
      this.maxUsiaPositif,
      this.maxusiaMeninggal,
      this.maxMeninggal,
      this.maxPositif,
      this.usiaPositif,
      this.usiaMeninggal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primarycolor,
        title: Text(
          "Kesimpulan Grafik",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
            CardKesimpulan(
              kesimpulanKasus: "${rataRata['positif']} ",
              judulTextKesimpulan: 'Rata-Rata Positif Perbulan:',
            ),
            CardKesimpulan(
              kesimpulanKasus: "${rataRata['sembuh']} ",
              judulTextKesimpulan: ' Rata-Rata Sembuh Perbulan:',
            ),
            CardKesimpulan(
              kesimpulanKasus: "${rataRata['meninggal']} ",
              judulTextKesimpulan: 'Rata-Rata Meninggal Perbulan:',
            ),
            CardKesimpulan(
              kesimpulanKasus: "${rataRata['dirawat']} ",
              judulTextKesimpulan: 'Rata-Rata Dirawat Perbulan:',
            ),
            CardKesimpulan(
              kesimpulanKasus: "${rataRata['tersuspek']} ",
              judulTextKesimpulan: 'Rata-Rata Tersuspek Perbulan:',
            ),
            CardKesimpulan(
              kesimpulanKasus: "${varianKasus['positif']} ",
              judulTextKesimpulan: 'Varian Positif Perbulan:',
            ),
            CardKesimpulan(
              kesimpulanKasus: "${varianKasus['sembuh']} ",
              judulTextKesimpulan: 'Varian Sembuh Perbulan:',
            ),
            CardKesimpulan(
              kesimpulanKasus: "${varianKasus['meninggal']} ",
              judulTextKesimpulan: 'Varian Meninggal Perbulan:',
            ),
            CardKesimpulan(
              kesimpulanKasus: "${varianKasus['dirawat']} ",
              judulTextKesimpulan: 'Varian Dirawat Perbulan:',
            ),
            CardKesimpulan(
              kesimpulanKasus: "${varianKasus['tersuspek']} ",
              judulTextKesimpulan: 'Varian Tersuspek Perbulan:',
            ),
          ],
        ),
      ),
    );
  }
}
