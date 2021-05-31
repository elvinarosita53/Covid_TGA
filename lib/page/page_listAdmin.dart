import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:menu_login/model/list_covid.dart';
import 'package:menu_login/page/page_login.dart';
import 'package:menu_login/template/template_admin.dart';

List namaPasien = [
  "si A",
  "si B",
  "si C",
  "si D",
  "si E",
  "si E",
  "si E",
  "si E",
  "si E",
  "si E",
  "si E",
];

class ListAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TemplateAdmin(
      body:
          //listview.builder agar jumlah data sama dgn yg di inputkan secara otomatis

          ListView.builder(
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
