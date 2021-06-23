import 'package:flutter/material.dart';
import 'package:menu_login/template/tamplate_panduan.dart';

class PanduanPelakuPerjalana extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TamplatePanduan(
      tittle: Text("Pelaku Perjalanan"),
      widgets: [
        Container(
          margin: EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
          ),
          child: Text(
            "Seseorang yang melakukan perjalanan dari dalam negeri (domestik) maupun luar negeri pada 14 hari terakhir.",
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}
