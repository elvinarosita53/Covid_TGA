import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:menu_login/widget/Input_data.dart';
import 'package:menu_login/widget/constant.dart';

class PageFormInput extends StatefulWidget {
  final String listID;
  final Map dataCovid;

  const PageFormInput({
    this.listID = "",
    this.dataCovid,
  });
  @override
  _PageFormInputState createState() => _PageFormInputState();
}

class _PageFormInputState extends State<PageFormInput> {
  String tglberangkat = "Tgl Berangkat";
  String tglawalgejala = "Tgl Awal Gejala";
  int currentBulan;
  int currentTahun;
  String currentKeterangan;
  String currentKecamatan;
  String currentjeniskelamin;

  TextEditingController nama = TextEditingController();

  TextEditingController alamat = TextEditingController();

  TextEditingController tahun = TextEditingController();

  TextEditingController jeniskelamin = TextEditingController();

  TextEditingController nohp = TextEditingController();

  TextEditingController daerah = TextEditingController();

  TextEditingController tandaGejala = TextEditingController();

  TextEditingController kondisiUmum = TextEditingController();

  TextEditingController tataLaksana = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.dataCovid != null) {
      nama.text = widget.dataCovid['nama'];
      currentKecamatan = widget.dataCovid['kecamatan'];
      alamat.text = widget.dataCovid['alamat'];
      currentTahun = widget.dataCovid['tahun'];
      currentBulan = widget.dataCovid['bulan'];
      currentjeniskelamin = widget.dataCovid['jenis kelamin'];
      nohp.text = widget.dataCovid['no. hp'];
      daerah.text = widget.dataCovid['daerah'];
      tglberangkat = widget.dataCovid['tgl berangkat'];
      tandaGejala.text = widget.dataCovid['tanda dan gejala'];
      tglawalgejala = widget.dataCovid['tgl awal gejala'];
      kondisiUmum.text = widget.dataCovid['kondisi umum'];
      tataLaksana.text = widget.dataCovid['tata laksanan yang dilakukan'];
      currentKeterangan = widget.dataCovid['keterangan'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primarycolor,
        //stiap statfull harus ada widget. apa gt
        title: Text(widget.listID),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            InputData(
              nama: "Nama",
              hintText: "Masukkan Nama",
              controlerinputdata: nama,
            ),
            Text(
              "Kecamatan",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              height: 53,
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: DropdownSearch<String>(
                dropdownSearchDecoration: InputDecoration(
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                ),
                items: Kecamatan,
                selectedItem: currentKecamatan,
                hint: "Kecamatan",
                maxHeight: 400,
                showClearButton: false,

                // label: "Search",
                onChanged: (value) {
                  currentKecamatan = value;
                },
                showSearchBox: false,
              ),
            ),
            InputData(
              nama: "Alamat",
              hintText: "Masukkan Alamat",
              controlerinputdata: alamat,
            ),
            Text(
              "Umur",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10),
                    height: 53,
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: DropdownSearch<int>(
                      dropdownSearchDecoration: InputDecoration(
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                      ),
                      items: umurTahun,
                      selectedItem: currentTahun,
                      hint: "Tahun",
                      maxHeight: 300,
                      showClearButton: false,

                      // label: "Search",
                      onChanged: (value) {
                        currentTahun = value;
                      },
                      showSearchBox: false,
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10),
                    height: 53,
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: DropdownSearch<int>(
                      dropdownSearchDecoration: InputDecoration(
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                      ),
                      items: umurBulan,
                      selectedItem: currentBulan,
                      hint: "Bulan",
                      maxHeight: 300,
                      showClearButton: false,
                      clearButtonBuilder: (context) => Icon(Icons.cancel),
                      // label: "Search",
                      onChanged: (value) {
                        currentBulan = value;
                      },
                      showSearchBox: false,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Jenis Kelamin",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              height: 53,
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: DropdownSearch<String>(
                dropdownSearchDecoration: InputDecoration(
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                ),
                items: ["laki-laki", "perempuan"],
                hint: "Jenis Kelamin",
                maxHeight: 120,
                selectedItem: currentjeniskelamin,
                showClearButton: false,
                clearButtonBuilder: (context) => Icon(Icons.cancel),
                // label: "Search",
                onChanged: (value) {
                  currentjeniskelamin = value;
                },
                showSearchBox: false,
              ),
            ),
            InputData(
              nama: "No.HP",
              hintText: "Masukkan Nomor Telepon",
              controlerinputdata: nohp,
            ),
            Row(
              children: [
                Expanded(
                    child: InputData(
                  nama: "Riwayat Perjalanan",
                  hintText: "Daerah/Negara",
                  controlerinputdata: daerah,
                )),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: GestureDetector(
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        tglberangkat,
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      ),
                      height: 53,
                      padding: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onTap: () async {
                      showDatePicker(
                        context: context,
                        initialDate: (tglberangkat != null)
                            ? DateFormat.yMd('id').parse(tglberangkat)
                            : DateTime.now(),
                        firstDate: DateTime(1990),
                        lastDate: DateTime(2030),
                      ).then(
                        (value) {
                          //ini di ganti jd string dulu valuenya DateFormat.yMd().format(value)
                          if (value != null) {
                            tglberangkat = DateFormat.yMd("id").format(value);
                            setState(() {});
                          }
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: InputData(
                    nama: "Riwayat Sakit",
                    hintText: "Tanda dan Gejala",
                    controlerinputdata: tandaGejala,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: GestureDetector(
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        tglawalgejala,
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      ),
                      height: 53,
                      padding: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: (tglawalgejala != null)
                            ? DateFormat.yMd('id').parse(tglawalgejala)
                            : DateTime.now(),
                        firstDate: DateTime(1990),
                        lastDate: DateTime(2030),
                      ).then(
                        (value) {
                          //ini di ganti jd string dulu valuenya DateFormat.yMd().format(value)
                          tglawalgejala = DateFormat.yMd("id").format(value);
                          setState(() {});
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            InputData(
              nama: "Kondisi Umum",
              hintText: "Masukkan Kondisi Umum",
              controlerinputdata: kondisiUmum,
            ),
            InputData(
              nama: "Tata Laksana yang Dilakukan",
              hintText: "Input Tatalaksana yang Dilakukan",
              controlerinputdata: tataLaksana,
            ),
            Text(
              "Keterangan",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              height: 53,
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: DropdownSearch<String>(
                dropdownSearchDecoration: InputDecoration(
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                ),
                items: keterangans,
                selectedItem: currentKeterangan,
                hint: "Keterangan",
                maxHeight: 400,
                showClearButton: false,

                // label: "Search",
                onChanged: (value) {
                  currentKeterangan = value;
                },
                showSearchBox: false,
              ),
            ),
            Column(
              children: [],
            ),
            (widget.dataCovid == null)
                ? GestureDetector(
                    onTap: () {
                      // deklarasi firebase
                      FirebaseFirestore emailFirebase =
                          FirebaseFirestore.instance;

                      // variabel yang nyimpan nama tabel(collaction)
                      CollectionReference data_covid =
                          emailFirebase.collection("data_covid");

                      data_covid.add({
                        'nama': nama.text,
                        'kecamatan': currentKecamatan,
                        'alamat': alamat.text,
                        'tahun': currentTahun,
                        'bulan': currentBulan,
                        'jenis kelamin': currentjeniskelamin,
                        'no. hp': nohp.text,
                        'daerah': daerah.text,
                        'tgl berangkat': tglberangkat,
                        'tanda dan gejala': tandaGejala.text,
                        'tgl awal gejala': tglawalgejala,
                        'kondisi umum': kondisiUmum.text,
                        'tata laksanan yang dilakukan': tataLaksana.text,
                        'keterangan': currentKeterangan,
                      });
                      nama.text = "";
                      currentKecamatan = "";
                      alamat.text = "";
                      currentTahun = null;
                      currentBulan = null;
                      currentjeniskelamin = null;
                      nohp.text = "";
                      daerah.text = "";
                      tglberangkat = "";
                      tandaGejala.text = "";
                      tandaGejala.text = "";
                      kondisiUmum.text = "";
                      tataLaksana.text = "";
                      currentKeterangan = null;
                    },
                    child: Container(
                      height: 40,
                      child: Text(
                        "SUBMIT",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: primarycolor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  )
                : GestureDetector(
                    onTap: () async {
                      await FirebaseFirestore.instance
                          .collection("data_covid")
                          .doc(widget.listID)
                          .update({
                        'nama': nama.text,
                        'kecamatan': currentKecamatan,
                        'alamat': alamat.text,
                        'tahun': currentTahun,
                        'bulan': currentBulan,
                        'jenis kelamin': currentjeniskelamin,
                        'no. hp': nohp.text,
                        'daerah': daerah.text,
                        'tgl berangkat': tglberangkat,
                        'tanda dan gejala': tandaGejala.text,
                        'tgl awal gejala': tglawalgejala,
                        'kondisi umum': kondisiUmum.text,
                        'tata laksanan yang dilakukan': tataLaksana.text,
                        'keterangan': currentKeterangan,
                      }).then((value) {
                        Fluttertoast.showToast(msg: "Berhasil Update");
                        Navigator.pop(context);
                      });
                    },
                    child: Container(
                      height: 40,
                      child: Text(
                        "UPDATE",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      alignment: Alignment.center,
                      // TODO jadikan variabel konstan diluar file
                      decoration: BoxDecoration(
                        color: primarycolor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
