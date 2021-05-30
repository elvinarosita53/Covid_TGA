import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PageFormInput extends StatelessWidget {
  TextEditingController nama = TextEditingController();
  TextEditingController kecamatan = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController tahun = TextEditingController();
  TextEditingController bulan = TextEditingController();
  TextEditingController jeniskelamin = TextEditingController();
  TextEditingController nohp = TextEditingController();
  TextEditingController daerah = TextEditingController();
  TextEditingController tglberangkat = TextEditingController();
  TextEditingController tandaGejala = TextEditingController();
  TextEditingController tglAwalGejala = TextEditingController();
  TextEditingController kondisiUmum = TextEditingController();
  TextEditingController tataLaksana = TextEditingController();
  TextEditingController keterangan = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue[900], title: Text("Input Data Covid")),
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
              children: [
                Expanded(
                    child: InputData(
                  nama: "Umur",
                  hintText: "Tahun",
                  controlerinputdata: tahun,
                )),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                    child: InputData(
                  nama: "",
                  hintText: "Bulan",
                  controlerinputdata: bulan,
                )),
              ],
            ),
            InputData(
              nama: "Jenis Kelamin",
              hintText: "Masukkan Jenis Kelamin",
              controlerinputdata: jeniskelamin,
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
                    child: InputData(
                  nama: "",
                  hintText: "Tgl Berangkat",
                  controlerinputdata: tglberangkat,
                )),
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
                    child: InputData(
                  nama: "",
                  hintText: "Tgl Awal Gejala",
                  controlerinputdata: tglAwalGejala,
                )),
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
                      'tahun': tahun.text,
                      'bulan': bulan.text,
                      'jenis kelamin': jeniskelamin.text,
                      'no. hp': nohp.text,
                      'daerah': daerah.text,
                      'tgl berangkat': tglberangkat.text,
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
                      color: Colors.blue[900],
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

class InputData extends StatelessWidget {
  final String nama;
  final String hintText;
  final TextEditingController controlerinputdata;

  const InputData({
    @required this.nama,
    @required this.hintText,
    @required this.controlerinputdata,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          nama,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextField(
          controller: controlerinputdata,
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
