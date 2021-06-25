import 'package:flutter/material.dart';
import 'package:menu_login/template/tamplate_panduan.dart';

class PanduanKasusKonfirmasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TamplatePanduan(
      tittle: Text("Kasus Konfirmasi"),
      widgets: [
        Container(
          margin: EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
          ),
          child: Text(
            "Seseorang yang dinyatakan positif terinfeksi virus COVID-19 yang dibuktikan dengan pemeriksaan laboratorium RT-PCR.Kasus konfirmasi dibagi menjadi 2:\n\na.\tKasus konfirmasi dengan gejala (simptomatik)\n\nb.\tKasus konfirmasi tanpa gejala (asimptomatik)",
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}
