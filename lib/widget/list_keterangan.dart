import 'package:flutter/material.dart';
import 'package:menu_login/widget/constant.dart';
import 'package:menu_login/example/dashboard2.dart';

class Listketerangan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Keterangan(
                keterangan: "meningggal",
                warna: kwarna_meninggal,
              ),
              Keterangan(
                keterangan: "sembuh",
                warna: kwarna_sembuh,
              ),
              Keterangan(
                keterangan: "positif",
                warna: kwarna_positif,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Keterangan(
                keterangan: "dirawat",
                warna: kwarna_dirawat,
              ),
              Keterangan(
                keterangan: "tersuspect",
                warna: kwarna_tersuspect,
              ),
            ],
          )
        ],
      ),
    );
  }
}
