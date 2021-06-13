import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:menu_login/template/template_bersama.dart';
import 'package:menu_login/widget/constant.dart';
import 'package:menu_login/widget/list_covid.dart';

List namaPasien = [
  "si A",
  "si B",
  "si C",
  "si D",
  "si E",
];

class PageListInstansi extends StatefulWidget {
  @override
  _PageListInstansiState createState() => _PageListInstansiState();
}

class _PageListInstansiState extends State<PageListInstansi> {
  String currentpilih;

  List dataCovid;

  @override
  Widget build(BuildContext context) {
    return TemplateBersama(
      namaAppbar: "Instansi Kesehatan",
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
        child: DropdownSearch<String>(
          dropdownButtonBuilder: (context) => CircleAvatar(
            child: Icon(
              Icons.arrow_drop_down,
              size: 35,
              color: primarycolor,
            ),
            radius: 25,
            backgroundColor: Colors.white,
          ),
          dropdownSearchDecoration: InputDecoration(
            fillColor: Colors.white.withOpacity(0.4),
            filled: true,
            hintStyle: TextStyle(
              color: Colors.white,
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none),
            isDense: true,
            contentPadding: EdgeInsets.only(left: 10),
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
            currentpilih = value;
            // currentKecamatan = value;
            setState(() {});
          },
          showSearchBox: true,
        ),
      ),
      body: ListView.builder(
        itemCount: namaPasien.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListCovid(),
          );
        },
      ),
    );
  }
}
