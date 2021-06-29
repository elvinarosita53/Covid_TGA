import 'dart:io';

import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

import 'model/tabel.dart';

class PdfApi {
  static Future<File> generateFile(Tabel dataTabel) async {
    final pdf = Document();
    // final imageSvg = await rootBundle.loadString('images/dinas_kesehatan.png');
    final imageJpg = (await rootBundle.load('images/dinas_kesehatan.png'))
        .buffer
        .asUint8List();
    final image119 =
        (await rootBundle.load('images/119.png')).buffer.asUint8List();
    final imageGermas =
        (await rootBundle.load('images/germas.png')).buffer.asUint8List();
    final imageKominfo =
        (await rootBundle.load('images/kominfo.png')).buffer.asUint8List();
    final imageSurveilans =
        (await rootBundle.load('images/surveilans.png')).buffer.asUint8List();

    pdf.addPage(
      MultiPage(
        orientation: PageOrientation.landscape,
        margin: EdgeInsets.fromLTRB(
          PdfPageFormat.cm * 1.5,
          PdfPageFormat.cm * 1.5,
          PdfPageFormat.cm * 1.5,
          PdfPageFormat.cm * 1.5,
        ),
        build: (context) => [
          headerKopSurat(
            imageJpg,
            imageKominfo,
          ),
          SizedBox(height: PdfPageFormat.cm * 1),
          ...buildTable(dataTabel),
          SizedBox(height: PdfPageFormat.cm * 1),
          Footer(
            leading: Text(
                "Tanggal Update :" + DateFormat.yMd().format(DateTime.now())),
            trailing: Row(
              children: [
                Container(
                  height: 1 * PdfPageFormat.cm,
                  width: 1 * PdfPageFormat.cm,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: MemoryImage(imageSurveilans),
                    ),
                  ),
                ),
                SizedBox(width: PdfPageFormat.cm),
                Container(
                  height: 1 * PdfPageFormat.cm,
                  width: 1 * PdfPageFormat.cm,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: MemoryImage(image119),
                    ),
                  ),
                ),
                SizedBox(width: PdfPageFormat.cm),
                Container(
                  height: 1 * PdfPageFormat.cm,
                  width: 1 * PdfPageFormat.cm,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: MemoryImage(imageGermas),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    String day = DateFormat.d().format(DateTime.now());
    String month = DateFormat.M().format(DateTime.now());
    String year = DateFormat.y().format(DateTime.now());
    return saveDocument(name: 'report_${day}_${month}_${year}.pdf', pdf: pdf);
  }

  static List<Widget> buildTable(Tabel dataTabel) {
    List jumlah = [];
    jumlah = dataTabel.items.map((item) {
      return item.kecamatans.bate +
          item.kecamatans.delima +
          item.kecamatans.geumpangPidie +
          item.kecamatans.geulumpangTiga +
          item.kecamatans.glumpangBaro +
          item.kecamatans.grongGrong +
          item.kecamatans.indraJaya +
          item.kecamatans.kembangTanjong +
          item.kecamatans.keumala +
          item.kecamatans.kotaSigli +
          item.kecamatans.mane +
          item.kecamatans.mila +
          item.kecamatans.muaraTiga +
          item.kecamatans.mutiara +
          item.kecamatans.mutiaraTimur +
          item.kecamatans.padangTiji +
          item.kecamatans.peukanBaro +
          item.kecamatans.pidie +
          item.kecamatans.sakti +
          item.kecamatans.simpangTiga +
          item.kecamatans.tangse +
          item.kecamatans.tiro +
          item.kecamatans.titeue;
    }).toList();

    final headers = [
      'Keterangan',
      "Bate",
      "Delima",
      "G.Pidie",
      "GLP.Tiga",
      "GLP.Baro",
      "Grong 2",
      "Indra Jaya",
      "KB.Tanjong",
      "Keumala",
      "KT.Sigli",
      "Mane",
      "Mila",
    ];
    final headers2 = [
      "M Tiga",
      'Keterangan',
      "Mutiara",
      "M.Timur",
      "P.Tiji",
      "PK Baro",
      "Pidie",
      "Sakti",
      "SP.Tiga",
      "Tangse",
      "Tiro",
      "Titeue",
      'Jumlah',
    ];

    // List<int>
    final data = dataTabel.items.map(
      (item) {
        return [
          item.keterangan,
          item.kecamatans.bate.toString(),
          item.kecamatans.delima.toString(),
          item.kecamatans.geumpangPidie.toString(),
          item.kecamatans.geulumpangTiga.toString(),
          item.kecamatans.glumpangBaro.toString(),
          item.kecamatans.grongGrong.toString(),
          item.kecamatans.indraJaya.toString(),
          item.kecamatans.kembangTanjong.toString(),
          item.kecamatans.keumala.toString(),
          item.kecamatans.kotaSigli.toString(),
          item.kecamatans.mane.toString(),
          item.kecamatans.mila.toString(),
        ];
      },
    ).toList();

    int count = 0;
    final data2 = dataTabel.items.map(
      (item) {
        return [
          item.keterangan,
          item.kecamatans.muaraTiga.toString(),
          item.kecamatans.mutiara.toString(),
          item.kecamatans.mutiaraTimur.toString(),
          item.kecamatans.padangTiji.toString(),
          item.kecamatans.peukanBaro.toString(),
          item.kecamatans.pidie.toString(),
          item.kecamatans.sakti.toString(),
          item.kecamatans.simpangTiga.toString(),
          item.kecamatans.tangse.toString(),
          item.kecamatans.tiro.toString(),
          item.kecamatans.titeue.toString(),
          jumlah[count++].toString(),
        ];
      },
    ).toList();

    return [
      Table.fromTextArray(
        data: data,
        headers: headers,
        border: null,
        headerStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
        cellStyle: TextStyle(fontSize: 9),
        headerDecoration: BoxDecoration(color: PdfColors.grey300),
        cellHeight: 30,
        cellAlignments: {
          0: Alignment.centerLeft,
          1: Alignment.center,
          2: Alignment.center,
          3: Alignment.center,
          4: Alignment.center,
          5: Alignment.center,
          6: Alignment.center,
          7: Alignment.center,
          8: Alignment.center,
          9: Alignment.center,
          10: Alignment.center,
          11: Alignment.center,
          12: Alignment.center,
        },
      ),
      SizedBox(height: PdfPageFormat.cm),
      Table.fromTextArray(
        data: data2,
        headers: headers2,
        border: null,
        headerStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
        cellStyle: TextStyle(fontSize: 9),
        headerDecoration: BoxDecoration(color: PdfColors.grey300),
        cellHeight: 30,
        cellAlignments: {
          0: Alignment.centerLeft,
          1: Alignment.center,
          2: Alignment.center,
          3: Alignment.center,
          4: Alignment.center,
          5: Alignment.center,
          6: Alignment.center,
          7: Alignment.center,
          8: Alignment.center,
          9: Alignment.center,
          10: Alignment.center,
          11: Alignment.center,
          12: Alignment.center,
        },
      ),
    ];
  }

  static Row headerKopSurat(Uint8List imageJpg, Uint8List imageKominfo) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 1 * PdfPageFormat.cm,
          width: 1 * PdfPageFormat.cm,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: MemoryImage(imageJpg),
            ),
          ),
        ),
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Column(
          children: [
            Text('PEMERINTAH KABUPATEN PIDIE'),
            Text('DINAS KOMUNIKASI, INFORMATIK DAN PERSANDIAN'),
            Text(
                'Alamat : Jalan Prof.A Madjid Ibrahim, E-mail: diskominfo.pidie@gmail.com'),
          ],
        ),
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Container(
          height: 1 * PdfPageFormat.cm,
          width: 1 * PdfPageFormat.cm,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: MemoryImage(imageKominfo),
            ),
          ),
        ),
      ],
    );
  }

  static Future<Widget> buildHeader() async {
    final imageJpg = (await rootBundle.load('images/dinas_kesehatan.png'))
        .buffer
        .asUint8List();
    final image119 =
        (await rootBundle.load('images/119.png')).buffer.asUint8List();
    final imageGermas =
        (await rootBundle.load('images/germas.png')).buffer.asUint8List();
    final imageKominfo =
        (await rootBundle.load('images/kominfo.png')).buffer.asUint8List();
    final imageSurveilans =
        (await rootBundle.load('images/surveilans.png')).buffer.asUint8List();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 1.5 * PdfPageFormat.cm,
          width: 1.5 * PdfPageFormat.cm,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: MemoryImage(imageJpg),
            ),
          ),
        ),
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Column(
          children: [
            Text('PEMERINTAH KABUPATEN PIDIE'),
            Text('DINAS KOMUNIKASI, INFORMATIK DAN PERSANDIAN'),
            Text(
                'Alamat : Jalan Prof.A Madjid Ibrahim, E-mail: diskominfo.pidie@gmail.com'),
          ],
        ),
        SizedBox(width: 0.5 * PdfPageFormat.cm),
        Container(
          height: 1.5 * PdfPageFormat.cm,
          width: 1.5 * PdfPageFormat.cm,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: MemoryImage(imageKominfo),
            ),
          ),
        ),
        Column(
          children: [
            Container(
              child: Row(children: [
                Container(
                  height: 1.5 * PdfPageFormat.cm,
                  width: 1.5 * PdfPageFormat.cm,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: MemoryImage(imageSurveilans),
                    ),
                  ),
                ),
                Container(
                  height: 1.5 * PdfPageFormat.cm,
                  width: 1.5 * PdfPageFormat.cm,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: MemoryImage(image119),
                    ),
                  ),
                ),
                Container(
                  height: 1.5 * PdfPageFormat.cm,
                  width: 1.5 * PdfPageFormat.cm,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: MemoryImage(imageGermas),
                    ),
                  ),
                ),
              ]),
            ),
            Container(
              child: Text("Pidie Sehat dan Mandiri Secara Islami"),
            )
          ],
        )
      ],
    );
  }

  static Future<File> saveDocument({
    @required String name,
    @required Document pdf,
  }) async {
    final bytes = await pdf.save();
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');
    await file.writeAsBytes(bytes);
    return file;
  }

  static Future openFile(File file) async {
    final url = file.path;
    await OpenFile.open(url);
  }
}
