import 'package:flutter/material.dart';

class ListCovid extends StatelessWidget {
  final String nama;
  final String keterangan_kasus;

  const ListCovid({
    this.nama = "Nama",
    this.keterangan_kasus = "Keterangan Kasus",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      // width: 200,
      // margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 5,
            spreadRadius: 2,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nama,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                keterangan_kasus,
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.delete,
                color: Colors.red,
                size: 20,
              ),
              SizedBox(
                height: 5,
              ),
              Icon(
                Icons.edit,
                color: Colors.blue[700],
                size: 20,
              ),
            ],
          )
        ],
      ),
    );
  }
}
