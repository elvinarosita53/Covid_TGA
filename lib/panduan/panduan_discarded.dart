import 'package:flutter/material.dart';
import 'package:menu_login/template/tamplate_panduan.dart';

class PanduanDiscarded extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TamplatePanduan(
      tittle: Text("Discarded"),
      widgets: [
        Container(
          margin: EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
          ),
          child: Text(
            "Discarded apabila memenuhi salah satu kriteria berikut:\n\na.\tSeseorang dengan status kasus suspek dengan hasil pemeriksaan RT-PCR 2 kali negatif selama 2 hari berturut-turut dengan selang waktu >24 jam.\n\nb.\tSeseorang dengan status kontak",
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}
