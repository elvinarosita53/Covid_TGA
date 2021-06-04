import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:menu_login/widget/Input_data.dart';
import 'package:menu_login/widget/constant.dart';

class PageFormInput extends StatefulWidget {
  @override
  _PageFormInputState createState() => _PageFormInputState();
}

class _PageFormInputState extends State<PageFormInput> {
  String tglberangkat = "Tgl Berangkat";
  String tglawalgejala = "Tgl Awal Gejala";

  int currentBulan;
  int currentTahun;

  String currentjeniskelamin;

  TextEditingController nama = TextEditingController();

  TextEditingController kecamatan = TextEditingController();

  TextEditingController alamat = TextEditingController();

  TextEditingController tahun = TextEditingController();

  TextEditingController jeniskelamin = TextEditingController();

  TextEditingController nohp = TextEditingController();

  TextEditingController daerah = TextEditingController();

  TextEditingController tandaGejala = TextEditingController();

  TextEditingController tglAwalGejala = TextEditingController();

  TextEditingController kondisiUmum = TextEditingController();

  TextEditingController tataLaksana = TextEditingController();

  TextEditingController keterangan = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue[400], title: Text("Input Data Covid")),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            InputData(
              nama: "Nama",
              hintText: "Masukkan Nama",
              controlerinputdata: nama,
            ),
            InputData(
              nama: "Kecamatan",
              hintText: "Masukkan Nama Kecamatan",
              controlerinputdata: kecamatan,
            ),
            InputData(
              nama: "Alamat",
              hintText: "Masukkan Alamat",
              controlerinputdata: alamat,
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
            Expanded(
              child: Container(
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
                  showClearButton: false,
                  clearButtonBuilder: (context) => Icon(Icons.cancel),
                  // label: "Search",
                  onChanged: (value) {
                    currentjeniskelamin = value;
                  },
                  showSearchBox: false,
                ),
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
                      await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1990),
                        lastDate: DateTime(2030),
                      ).then(
                        (value) {
                          //ini di ganti jd string dulu valuenya DateFormat.yMd().format(value)
                          tglberangkat = DateFormat.yMd("id").format(value);
                        },
                      );
                      setState(() {});
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
                    onTap: () async {
                      await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1990),
                        lastDate: DateTime(2030),
                      ).then(
                        (value) {
                          //ini di ganti jd string dulu valuenya DateFormat.yMd().format(value)
                          tglawalgejala = DateFormat.yMd("id").format(value);
                        },
                      );
                      setState(() {});
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
            InputData(
              nama: "Keterangan",
              hintText: "Masukkan Keterangan Kasus",
              controlerinputdata: keterangan,
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    // deklarasi firebase
                    FirebaseFirestore emailFirebase =
                        FirebaseFirestore.instance;

                    // variabel yang nyimpan nama tabel(collaction)
                    CollectionReference data_covid =
                        emailFirebase.collection("data_covid");

                    data_covid.add({
                      'nama': nama.text,
                      'kecamatan': kecamatan.text,
                      'alamat': alamat.text,
                      'tahun': currentTahun,
                      'bulan': currentBulan,
                      'jenis kelamin': currentjeniskelamin,
                      'no. hp': nohp.text,
                      'daerah': daerah.text,
                      'tgl berangkat': tglberangkat,
                      'tanda dan gejala': tandaGejala.text,
                      'tgl awal gejala': tandaGejala.text,
                      'kondisi umum': kondisiUmum.text,
                      'tata laksanan yang dilakukan': tataLaksana.text,
                      'keterangan': keterangan.text,
                    });
                    data_covid.add({''});
                  },
                  child: Container(
                    height: 40,
                    width: 100,
                    child: Text(
                      "SUBMIT",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.blue[400],
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
