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

  final Map<String, double> rataRata;
  final Map<String, double> varianKasus;

  PageDetailKesimpulan({
    this.maxKecamatanPositif,
    this.maxKecamatanMeninggal,
    this.maxUsiaPositif,
    this.maxusiaMeninggal,
    this.maxMeninggal,
    this.maxPositif,
    this.varianKasus,
    this.rataRata,
  });

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
            // CardKesimpulan(
            //   kesimpulanKasus: "${rataRata['positif'].toStringAsFixed(2)} ",
            //   judulTextKesimpulan: 'Rata-Rata Positif Perbulan:',
            // ),
            // CardKesimpulan(
            //   kesimpulanKasus: "${rataRata['sembuh'].toStringAsFixed(2)} ",
            //   judulTextKesimpulan: ' Rata-Rata Sembuh Perbulan:',
            // ),
            // CardKesimpulan(
            //   kesimpulanKasus: "${rataRata['meninggal'].toStringAsFixed(2)} ",
            //   judulTextKesimpulan: 'Rata-Rata Meninggal Perbulan:',
            // ),
            // CardKesimpulan(
            //   kesimpulanKasus: "${rataRata['dirawat'].toStringAsFixed(2)} ",
            //   judulTextKesimpulan: 'Rata-Rata Dirawat Perbulan:',
            // ),
            // CardKesimpulan(
            //   kesimpulanKasus: "${rataRata['tersuspek'].toStringAsFixed(2)} ",
            //   judulTextKesimpulan: 'Rata-Rata Tersuspek Perbulan:',
            // ),
            // CardKesimpulan(
            //   kesimpulanKasus: "${varianKasus['positif'].toStringAsFixed(2)} ",
            //   judulTextKesimpulan: 'Varian Positif Perbulan:',
            // ),
            // CardKesimpulan(
            //   kesimpulanKasus: "${varianKasus['sembuh'].toStringAsFixed(2)} ",
            //   judulTextKesimpulan: 'Varian Sembuh Perbulan:',
            // ),
            // CardKesimpulan(
            //   kesimpulanKasus:
            //       "${varianKasus['meninggal'].toStringAsFixed(2)} ",
            //   judulTextKesimpulan: 'Varian Meninggal Perbulan:',
            // ),
            // CardKesimpulan(
            //   kesimpulanKasus: "${varianKasus['dirawat'].toStringAsFixed(2)} ",
            //   judulTextKesimpulan: 'Varian Dirawat Perbulan:',
            // ),
            // CardKesimpulan(
            //   kesimpulanKasus:
            //       "${varianKasus['tersuspek'].toStringAsFixed(2)} ",
            //   judulTextKesimpulan: 'Varian Tersuspek Perbulan:',
            // ),
          ],
        ),
      ),
    );
  }
}
