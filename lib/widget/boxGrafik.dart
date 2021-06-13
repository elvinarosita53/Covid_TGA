import 'package:flutter/material.dart';

class Boxgrafik extends StatelessWidget {
  final Color kotalKecil;
  final String kasus;
  final int total;
  final Function onBottonShow;

  const Boxgrafik({
    @required this.kotalKecil,
    @required this.kasus,
    @required this.total,
    @required this.onBottonShow,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onBottonShow,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          padding: EdgeInsets.only(left: 10, top: 13, bottom: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  buildLingkaranKecil(),
                  textJudulKasus(),
                ],
              ),
              textJumlahKasus(),
            ],
          ),
          width: MediaQuery.of(context).size.width / 2,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }

  Text textJumlahKasus() {
    return Text(
      total.toString(),
      style: TextStyle(
          color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
    );
  }

  Text textJudulKasus() {
    return Text(
      kasus,
      style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic),
    );
  }

  Container buildLingkaranKecil() {
    return Container(
      margin: EdgeInsets.only(
        right: 5,
      ),
      width: 15,
      height: 15,
      decoration: BoxDecoration(
          color: kotalKecil,
          borderRadius: BorderRadius.circular(10),
          border: Border.all()),
    );
  }
}
