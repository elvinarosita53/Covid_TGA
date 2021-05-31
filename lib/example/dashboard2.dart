import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:menu_login/model/build_buttonShow.dart';
import 'package:menu_login/model/list_keterangan.dart';

import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:menu_login/template/template.dart';
import 'package:menu_login/model/widgets.dart';

class Dashboard2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //untuk memformat inisial tanggal sesuai negara
    initializeDateFormatting();
    DateTime waktusekarang = DateTime.now();
    //('id') : code negara yg di tuju
    String date = DateFormat.yMMMMd('id').format(waktusekarang);
    return Template(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                padding: EdgeInsets.only(left: 10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue[900], width: 2),
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
                  onChanged: print,
                  showSearchBox: true,
                ),
              ),
            ),
            buildChart(context),
            Listketerangan(),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BuildButtonShow(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Keterangan extends StatelessWidget {
  final String keterangan;
  final Color warna;

  const Keterangan({
    @required this.keterangan,
    @required this.warna,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 5,
          width: 5,
          color: warna,
        ),
        Text(keterangan),
      ],
    );
  }
}

class ListData extends StatelessWidget {
  final String kasus;
  final int jumlah;

  const ListData({this.kasus, this.jumlah});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(kasus),
              Text(jumlah.toString()),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Divider(
          endIndent: 20,
          indent: 20,
          color: Colors.grey[500],
          height: 10,
          thickness: 3,
        ),
      ],
    );
  }
}
