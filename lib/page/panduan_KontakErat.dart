import 'package:flutter/material.dart';
import 'package:menu_login/template/tamplate_panduan.dart';

class PanduanKontakErat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TamplatePanduan(
      tittle: Text("Kontak Erat"),
      widgets: [
        Container(
          margin: EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
          ),
          child: Text(
            "Orang yang memiliki riwayat kontak dengan kasus probable atau konfirmasi COVID-19. Riwayat kontak yang dimaksud antara lain:\n\na.\tKontak tatap muka/berdekatan dengan kasus probable atau kasus konfirmasi dalam radius 1 meter dan dalam jangka waktu 15 menit atau lebih.\n\nb.\tSentuhan fisik langsung dengan kasus probable atau konfirmasi (seperti bersalaman, berpegangan tangan, dan lain-lain).\n\nc.\tOrang yang memberikan perawatan langsung terhadap kasus probable atau konfirmasi tanpa menggunakan APD yang sesuai standar.\n\nd.\tSituasi lainnya yang mengindikasikan adanya kontak berdasarkan penilaian risiko lokal yang ditetapkan oleh tim penyelidikan epidemiologi setempat (penjelasan sebagaimana terlampir).\nPada kasus probable atau konfirmasi yang bergejala (simptomatik), untuk menemukan kontak erat periode kontak dihitung dari 2 hari sebelum kasus timbul gejala dan hingga 14 hari setelah kasus timbul gejala.\nPada kasus konfirmasi yang tidak bergejala (asimptomatik), untuk menemukan kontak erat periode kontak dihitung dari 2 hari sebelum dan 14 hari setelah tanggal pengambilan spesimen kasus konfirmasi.",
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}
