import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:menu_login/example/dashboard2.dart';

class TabelBottomShow extends StatelessWidget {
  final String kasusTabel;
  final int jumlah;
  final List<Map> isiTabel;

  const TabelBottomShow(
      {this.kasusTabel, this.jumlah, @required this.isiTabel});
  @override
  Widget build(BuildContext context) {
    var headerBottomShow = [
      Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        height: 10,
        width: 100,
        decoration: BoxDecoration(
            color: Colors.grey[600].withOpacity(0.4),
            borderRadius: BorderRadius.circular(20)),
      ),
      Text(
        "Kasus Covid-19 Terkonfirmasi",
        style: TextStyle(
            fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
      ),
      Divider(
        color: Colors.grey[300],
        height: 10,
        thickness: 3,
      ),
      SizedBox(
        height: 10,
      ),
    ];

    var contentTabel = isiTabel.map((perItem) {
      return ListData(
        jumlah: perItem['total'],
        kasus: perItem['kasus'],
      );
    }).toList();

    return Material(
      elevation: 3,
      color: Colors.grey[400].withOpacity(0.5),
      borderRadius: BorderRadius.circular(20),
      child: Container(
        margin: EdgeInsets.only(top: 2),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        child: Column(
          children: headerBottomShow + contentTabel,
        ),
      ),
    );
  }
}
