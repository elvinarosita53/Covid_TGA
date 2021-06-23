import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:menu_login/main_page.dart';
import 'package:menu_login/page/page_login.dart';
import 'package:menu_login/template/tamplate_panduan.dart';
import 'package:menu_login/widget/constant.dart';

class PanduanKasusSuspek extends StatefulWidget {
  @override
  _PanduanKasusSuspekState createState() => _PanduanKasusSuspekState();
}

class _PanduanKasusSuspekState extends State<PanduanKasusSuspek> {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return TamplatePanduan(
      tittle: Text("Kasus Suspek"),
      widgets: [
        Container(
          margin: EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
          ),
          child: Text(
            "Orang yang memiliki riwayat kontak dengan kasus probable atau konfirmasi COVID-19. Riwayat kontak yang dimaksud antara lain: \n\na.\tKontak tatap muka/berdekatan dengan kasus probable atau kasus konfirmasi dalam radius 1 meter dan dalam jangka waktu 15 menit atau lebih.\n\nb.\tSentuhan fisik langsung dengan kasus probable atau konfirmasi (seperti bersalaman, berpegangan tangan, dan lain-lain).",
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}
