import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

// deklarasi warna
class ExampleLineChartSample2 extends StatelessWidget {
  LineChartBarData grafikSembuh = LineChartBarData(
    spots: [
      FlSpot(0, 6), //membtuk satu titik (0,6)
      FlSpot(2.6, 2), //membtuk satu titik (2.6,2)
      FlSpot(4.9, 5), //membtuk satu titik (4.9,5)
      FlSpot(6.8, 3.1),
      FlSpot(8, 4),
      FlSpot(9.5, 3),
      FlSpot(10, 4),
    ],

    //NOTE Design Line Chart
    // true => grafik lengkung, false => grafik bersudut
    isCurved: true,

    //atur warna line chart
    colors: [
      Colors.green[300],
      Colors.green,
    ],
    barWidth: 2, // ketebalan garis
    isStrokeCapRound: true,
    dotData: FlDotData(
      show: true,
    ),

    //NOTE kasih warna dibawah garis
    // uncomment coding dibawah untuk memberikan grafik dengan line area
    // belowBarData: BarAreaData(
    //   show: true,
    //   colors: [
    //     Colors.green[300],
    //     Colors.green,
    //   ].map((color) => color.withOpacity(0.3)).toList(),
    // ),
  );

  LineChartBarData grafikSakit = LineChartBarData(
    spots: [
      FlSpot(0, 3),
      FlSpot(2.6, 4),
      FlSpot(4.9, 6),
      FlSpot(6.8, 8),
      FlSpot(8, 3),
      FlSpot(9.5, 2),
      FlSpot(10, 2),
    ],
    isCurved: true,

    colors: [
      Colors.red[200],
      Colors.red,
    ],
    barWidth: 2,
    isStrokeCapRound: true,
    dotData: FlDotData(
      show: true,
    ),

    // NOTE kasih warna dibawah garis
    // uncomment coding dibawah untuk memberikan grafik dengan line area
    // belowBarData: BarAreaData(
    //   show: true,
    //   colors: [
    //     Colors.red[200],
    //     Colors.red,
    //   ].map((color) => color.withOpacity(0.3)).toList(),
    // ),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        buildChart(context),
      ],
    );
  }

  Widget buildChart(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      decoration: BoxDecoration(
        color: Color(0xff232d37),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: LineChart(
          mainData(),
        ),
      ),
    );
  }

  LineChartData mainData() {
    return LineChartData(
      //NOTE Grafik Size
      //nilai maksimal sumbu x dan sumbu y
      minX: 0,
      maxX: 12,
      minY: 0,
      maxY: 10,

      //NOTE data yang akan di tampilkan
      lineBarsData: [
        // LineChartBarData menghasilkan 1 line chart
        grafikSembuh,
        grafikSakit,
      ],

      // NOTE design background  membuat garis pada background grafik
      gridData: FlGridData(
        show: true,
        //NOTE design garis background Horizontal
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d), //warna garis
            strokeWidth: 1, //ketebalan garis
            dashArray: [5, 10], // 5px panjang garis, 10px spasi
          );
        },

        //NOTE design garis Vertikal
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),

      //NOTE Judul Pada Grafik
      titlesData: FlTitlesData(
        show: true,
        //NOTE keterangan sumbu x
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 40, // ?
          rotateAngle: 300, //putar tulisan 300 derajat
          margin: 8, // spasi tulisan dengan grafik
          getTextStyles: (value) => const TextStyle(
            //ubah style tulisan
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          getTitles: (value) {
            //karena pada properti minX dan maxX sudah kita deklarasikan sebesar 0 dan 12
            switch (value.toInt()) {
              //ubah nama text sumbu x sesuai keinginan
              case 1:
                return 'January';
              case 2:
                return 'February';
              case 3:
                return 'March';
              case 4:
                return 'April';
              case 5:
                return 'Mei';
              case 6:
                return 'June';
              case 7:
                return 'July';
              case 8:
                return 'August';
              case 9:
                return 'September';
              case 10:
                return 'October';
              case 11:
                return 'November';
              case 12:
                return 'December';
            }
            return '';
          },
        ),

        // teks pada sumbu y
        leftTitles: SideTitles(
          showTitles: true,
          rotateAngle: 315,
          getTextStyles: (value) => const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10k';
              case 5:
                return '30k';
              case 10:
                return '50k';
            }
            return '';
          },
          // reservedSize: 28,
          margin: 12,
        ),
      ),

      // NOTE Design Kotak Grafik
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d), width: 1),
      ),
    );
  }
}
