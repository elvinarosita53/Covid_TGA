import 'package:flutter/material.dart';
import 'package:menu_login/main_page.dart';
import 'package:menu_login/page/page_dashboard.dart';
import 'package:menu_login/page/page_panduan.dart';
import 'package:menu_login/widget/constant.dart';

class PageGetStart extends StatelessWidget {
  int spacerAtas = 3;
  int spacerTengah = 4;
  int spacerBawah = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primarycolor,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: textPrimaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(70),
                bottomRight: Radius.circular(70),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // SizedBox(
              //   width: MediaQuery.of(context).size.width,
              // ),
              // Spacer(
              //   flex: spacerAtas,
              // ),
              Image(
                width: 350,
                image: AssetImage("images/NEW.png"),
              ),
              // Icon(
              //   Icons.format_quote,
              //   color: Colors.white,
              //   size: 80,
              // ),

              // SizedBox(height: 20),

              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TigaM(
                          judul: "Memakai \nMasker",
                          gambar: "images/memakai masker.png",
                        ),
                        TigaM(
                          judul: "Mencuci \nTangan",
                          gambar: "images/jabat_tangan.png",
                        ),
                        TigaM(
                          judul: "Menjaga \nJarak",
                          gambar: "images/jaga_jarak.png",
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TigaM(
                          judul: "Memakai \nMasker",
                          gambar: "images/memakai masker.png",
                        ),
                        TigaM(
                          judul: "Mencuci \nTangan",
                          gambar: "images/jabat_tangan.png",
                        ),
                        TigaM(
                          judul: "Menjaga \nJarak",
                          gambar: "images/jaga_jarak.png",
                        ),
                      ],
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
                        builder: (context) => MainPage(),
                      ));
                },
                child: Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                    margin: EdgeInsets.all(3),
                    alignment: Alignment.center,
                    child: Text(
                      "Get Start",
                      style: TextStyle(
                          fontSize: 20,
                          color: textPrimaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                      border: Border.all(color: textPrimaryColor, width: 3),
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Spacer(
                flex: spacerBawah,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TigaM extends StatelessWidget {
  final String judul;
  // final IconData gambar;
  final String gambar;

  const TigaM({@required this.judul, @required this.gambar});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image(
          height: MediaQuery.of(context).size.width / 3 - 50,
          width: MediaQuery.of(context).size.width / 3 - 50,
          fit: BoxFit.cover,
          image: AssetImage(gambar),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 3 - 50,
          // color: Colors.amber,

          child: Text(
            judul,
            style: TextStyle(
              fontSize: 12,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
