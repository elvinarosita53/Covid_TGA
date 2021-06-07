import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:menu_login/widget/build_buttonShow.dart';
import 'package:menu_login/widget/constant.dart';
import 'package:menu_login/template/template.dart';
import 'package:menu_login/widget/widgets.dart';

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
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: EdgeInsets.all(15),
                  child: buildChart(context),
                ),
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

  Widget searchBox(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        color: primarycolor,
      ),
      padding: EdgeInsets.only(bottom: 20, left: 20, right: 20),
      child: Container(
        padding: EdgeInsets.only(left: 10),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: primarySearchColor, borderRadius: BorderRadius.circular(40)),
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
            hintStyle: TextStyle(color: Colors.white),
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
    return Container(
      height: 200,
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Boxgrafik(
            kasus: "meninggal",
            total: "23456",
            kotalKecil: kwarna_meninggal,
          ),
          Boxgrafik(
            kasus: "positif",
            total: "2444",
            kotalKecil: kwarna_positif,
          ),
          Boxgrafik(
            kasus: "sembuh",
            total: "23456",
            kotalKecil: kwarna_sembuh,
          ),
          Boxgrafik(
            kasus: "dirawat",
            total: "377",
            kotalKecil: kwarna_dirawat,
          ),
          Boxgrafik(
            kasus: "tersuspek",
            total: "222",
            kotalKecil: kwarna_tersuspect,
          )
        ],
      ),
    );
  }
}

class Boxgrafik extends StatelessWidget {
  final Color kotalKecil;
  final String kasus;
  final String total;

  const Boxgrafik({
    @required this.kotalKecil,
    @required this.kasus,
    @required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        padding: EdgeInsets.only(left: 7, top: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      color: kotalKecil,
                      borderRadius: BorderRadius.circular(10)),
                ),
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
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        width: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
