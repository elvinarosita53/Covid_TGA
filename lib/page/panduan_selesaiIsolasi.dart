import 'package:flutter/material.dart';
import 'package:menu_login/template/tamplate_panduan.dart';

class PanduanSelesaiIsolasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TamplatePanduan(
      tittle: Text("Selesai Isolasi"),
      widgets: [
        Container(
          margin: EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
          ),
          child: Text(
            "Selesai isolasi apabila memenuhi salah satu kriteria berikut:\n\na.\tKasus konfirmasi tanpa gejala (asimptomatik) yang tidak dilakukan pemeriksaan follow up RT-PCR dengan ditambah 10 hari isolasi mandiri sejak pengambilan spesimen diagnosis konfirmasi.\n\nb.\tKasus probable/kasus konfirmasi dengan gejala (simptomatik) yang tidak dilakukan pemeriksaan follow up RT-PCR dihitung 10 hari sejak tanggal onset dengan ditambah minimal 3 hari setelah tidak lagi menunjukkan gejala demam dan gangguan pernapasan.\n\nc.\tKasus probable/kasus konfirmasi dengan gejala (simptomatik) yang mendapatkan hasil pemeriksaan follow up RT-PCR 1 kali negatif, dengan ditambah minimal 3 hari setelah tidak lagi menunjukkan gejala demam dan gangguan pernapasan.\n\nKetentuan lebih lanjut mengenai kriteria selesai isolasi pada kasus probable/kasus konfirmasi dapat dilihat dalam Bab Manajemen Klinis.",
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}
