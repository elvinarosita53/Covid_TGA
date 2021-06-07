import 'package:flutter/material.dart';
import 'package:menu_login/page/page_dashboard.dart';
import 'package:menu_login/widget/constant.dart';

class GetStart extends StatelessWidget {
  int spacerAtas = 3;
  int spacerTengah = 4;
  int spacerBawah = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
          ),
          Spacer(
            flex: spacerAtas,
          ),
          Icon(
            Icons.format_quote,
            color: primarycolor,
            size: 80,
          ),
          Text(
            "Bersama Kita Cegah Penyebaran",
            style: TextStyle(
                fontSize: 17,
                fontStyle: FontStyle.italic,
                color: textPrimaeyColor),
          ),
          SizedBox(height: 5),

          Text(
            "COVID-19",
            style: TextStyle(
              fontSize: 60,
              // fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w700,
              color: primarycolor,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          SizedBox(
            width: 300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TigaM(
                  judul: "Memakai Masker",
                  gambar: Icons.masks_outlined,
                ),
                TigaM(
                  judul: "Mencuci Tangan",
                  gambar: Icons.wash_outlined,
                ),
                TigaM(
                  judul: "Menjaga Jarak",
                  gambar: Icons.social_distance_outlined,
                ),
              ],
            ),
          ),

          Spacer(
            flex: spacerTengah,
          ),

          //bagian melihat halaman selanjutnya
          InkWell(
            borderRadius: BorderRadius.circular(25),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PageDashboard(),
                  ));
            },
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "Get Start",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: primarycolor,
              ),
            ),
          ),
          Spacer(
            flex: spacerBawah,
          ),
        ],
      ),
    );
  }
}

class TigaM extends StatelessWidget {
  final String judul;
  final IconData gambar;

  const TigaM({@required this.judul, @required this.gambar});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.center,
          child: Icon(
            gambar,
            size: (gambar == Icons.masks_outlined) ? 60 : 40,
            color: Colors.white,
          ),
          height: 90,
          width: 90,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 2,
                  spreadRadius: 3,
                  offset: Offset(1, 1)),
            ],
            color: Colors.blue,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        Container(
          width: 100,
          // color: Colors.amber,
          margin: EdgeInsets.only(
            top: 10,
          ),
          child: Text(
            judul,
            style: TextStyle(
              fontSize: 15,
              color: textPrimaeyColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}