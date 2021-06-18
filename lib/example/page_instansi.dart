import 'package:flutter/material.dart';
import 'package:menu_login/widget/build_chart.dart';
import 'package:menu_login/widget/list_covid.dart';
import 'package:menu_login/widget/list_keterangan.dart';
import 'package:menu_login/example/template_instansi.dart';

class PageInstansi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TemplateInstansi(
      body: Container(
        child: ListView(
          children: [
            BuildChart(),
            Listketerangan(),

            //copyWith : misal mau buat style yg sama tapi ada beberapa yg beda
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3,
                    color: Colors.grey[400],
                  )
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "List Data",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  ListCovid(
                    nama: "Isa",
                    keterangan_kasus: "Positif",
                  ),
                  ListCovid(),
                  ListCovid(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
