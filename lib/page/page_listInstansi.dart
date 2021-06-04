import 'package:flutter/material.dart';
import 'package:menu_login/widget/list_covid.dart';
import 'package:menu_login/template/template_instansi.dart';

List namaPasien = [
  "si A",
  "si B",
  "si C",
  "si D",
  "si E",
];

class PageListInstansi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TemplateInstansi(
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
