import 'package:flutter/material.dart';
import 'package:menu_login/template/tamplate_panduan.dart';

class PanduanKematian extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TamplatePanduan(
      tittle: Text("Kematian"),
      widgets: [
        Container(
          margin: EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
          ),
          child: Text(
            "Kematian COVID-19 untuk kepentingan surveilans adalah kasus konfirmasi/probable COVID-19 yang meninggal.",
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}
