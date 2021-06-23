import 'package:flutter/material.dart';
import 'package:menu_login/template/tamplate_panduan.dart';

class PanduanKasusProbable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TamplatePanduan(
      tittle: Text("Kasus Probable"),
      widgets: [
        Container(
          margin: EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
          ),
          child: Text(
            "Kasus suspek dengan ISPA Berat/ARDS***/meninggal dengan gambaran klinis yang meyakinkan COVID-19 DAN belum ada hasil pemeriksaan laboratorium RT-PCR.",
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}
