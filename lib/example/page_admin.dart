import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:menu_login/widget/build_chart.dart';
import 'package:menu_login/widget/list_covid.dart';
import 'package:menu_login/widget/list_keterangan.dart';
import 'package:menu_login/template/template_bersama.dart';

class PageAdmin extends StatefulWidget {
  @override
  _PageAdminState createState() => _PageAdminState();
}

class _PageAdminState extends State<PageAdmin> {
  String currentKecamatan;
  @override
  Widget build(BuildContext context) {
    return TemplateBersama(
      body: Container(
        child: ListView(
          children: [
            searchBox(context),
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
      namaAppbar: '',
    );
  }

  Padding searchBox(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        padding: EdgeInsets.only(left: 10),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.blue[400], width: 2),
            borderRadius: BorderRadius.circular(40)),
        child: DropdownSearch<String>(
          dropdownSearchDecoration: InputDecoration(
            border: InputBorder.none,
            isDense: true,
            contentPadding: EdgeInsets.zero,
          ),
          items: [
            "kec.a",
            "kec.b",
            "kec.c",
            "kec.d",
            "kec.e",
          ],

          hint: "Search",
          maxHeight: 300,
          showClearButton: true,
          clearButtonBuilder: (context) => Icon(Icons.cancel),
          // label: "Search",
          onChanged: (value) {
            currentKecamatan = value;
            setState(() {});
          },
          showSearchBox: true,
        ),
      ),
    );
  }
}
