import 'package:carousel_slider/carousel_slider.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:menu_login/model/build_buttonShow.dart';
import 'package:menu_login/model/constant.dart';
import 'package:menu_login/template/template.dart';
import 'package:menu_login/model/widgets.dart';

// //searchBox
// searchBox(context),
// //grafik data
// buildChart(context),
// //carosel
// buildCarosel(),
class PageDashboard extends StatefulWidget {
  @override
  _PageDashboardState createState() => _PageDashboardState();
}

class _PageDashboardState extends State<PageDashboard> {
  String currentKecamatan;

  @override
  Widget build(BuildContext context) {
    return Template(
      body: ListView(
        children: (currentKecamatan == null)
            ? [
                searchBox(context),
                buildChart(context),
                buildCarosel(),
              ]
            : [
                searchBox(context),
                buildChart(context),
                BuildButtonShow(),
              ],
      ),
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

  Widget buildCarosel() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: CarouselSlider(
            items: [
              Boxgrafik(
                  kasus: "meninggal",
                  total: "23456",
                  warna: kwarnagradien_meninggal),
              Boxgrafik(
                kasus: "positif",
                total: "2444",
                warna: kwarnagradien_positif,
              ),
              Boxgrafik(
                kasus: "sembuh",
                total: "23456",
                warna: kwarnagradien_sembuh,
              ),
              Boxgrafik(
                  warna: kwarnagradien_dirawat, kasus: "dirawat", total: "377"),
              Boxgrafik(
                  warna: kwarnagradien_tersuspect,
                  kasus: "tersuspek",
                  total: "222")
            ],
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
            ),
          ),
        )
      ],
    );
  }
}

class Boxgrafik extends StatelessWidget {
  final Gradient warna;
  final String kasus;
  final String total;

  const Boxgrafik({
    @required this.warna,
    @required this.kasus,
    @required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 7, top: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                kasus,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
            ],
          ),
          Text(
            total,
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      margin: EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: warna,
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
