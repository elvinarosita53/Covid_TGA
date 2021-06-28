import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'package:intl/intl.dart';
import 'package:menu_login/widget/Input_data.dart';
import 'package:menu_login/widget/constant.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class PageFormInput extends StatefulWidget {
  final String namaAsalUser;
  final Map dataCovid;

  const PageFormInput({
    this.namaAsalUser = "",
    this.dataCovid,
  });
  @override
  _PageFormInputState createState() => _PageFormInputState();
}

class _PageFormInputState extends State<PageFormInput> {
  FirebaseAuth auth = FirebaseAuth.instance;
  bool isLoading = false;
  var formkey = GlobalKey<FormState>();
  String tglberangkat;
  String tglawalgejala;
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
  TextEditingController catatanTambahan = TextEditingController();

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
      nohp.text = widget.dataCovid['hp'];
      daerah.text = widget.dataCovid['daerah'];
      tglberangkat = widget.dataCovid['tgl berangkat'];
      tandaGejala.text = widget.dataCovid['tanda dan gejala'];
      tglawalgejala = widget.dataCovid['tgl awal gejala'];
      kondisiUmum.text = widget.dataCovid['kondisi umum'];
      tataLaksana.text = widget.dataCovid['tata laksanan yang dilakukan'];
      currentKeterangan = widget.dataCovid['keterangan'];
      catatanTambahan.text = widget.dataCovid['catatan tambahan'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primarycolor,
        //stiap statfull harus ada widget. apa gt
        title: Text("Data Pasien"),
      ),
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
            key: formkey,
            child: ListView(
              children: [
                InputData(
                  nama: "Nama",
                  hintText: "Masukkan Nama",
                  controlerinputdata: nama,
                ),
                Center(),
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
                          validator: (value) {
                            if (value == null) {
                              return "Harap di Isi";
                            }
                          },
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
                          validator: (value) {
                            if (value == null) {
                              return "Harap di Isi";
                            }
                          },
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
                    validator: (value) {
                      if (value == null) {
                        return "Harap di Isi";
                      }
                    },
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
                  nama: "Alamat",
                  hintText: "Masukkan Alamat",
                  controlerinputdata: alamat,
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
                    validator: (value) {
                      if (value == null) {
                        return "Harap di Isi";
                      }
                    },
                    dropdownSearchDecoration: InputDecoration(
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                    items: kecamatan,
                    selectedItem: currentKecamatan,
                    hint: "Kecamatan",
                    maxHeight: 400,
                    showClearButton: false,

                    // label: "Search",
                    onChanged: (value) {
                      currentKecamatan = value;
                      setState(() {});
                    },
                    showSearchBox: false,
                  ),
                ),
                InputData(
                  nama: "No.HP",
                  hintText: "Masukkan Nomor Telepon",
                  controlerinputdata: nohp,
                  isRequied: false,
                ),
                Row(
                  children: [
                    Expanded(
                      child: InputData(
                        nama: "Riwayat Perjalanan",
                        hintText: "Daerah/Negara",
                        controlerinputdata: daerah,
                        isRequied: false,
                        onChange: (value) {
                          setState(() {});
                        },
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
                            (daerah.text == '')
                                ? "Tgl Berangkat"
                                : tglberangkat ?? "Tgl Berangkat",
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey[600]),
                          ),
                          height: 53,
                          padding: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            border: (daerah.text == '')
                                ? Border.all(color: Colors.grey, width: 0)
                                : Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(15),
                            color: (daerah.text == '')
                                ? Colors.grey[300]
                                : Colors.transparent,
                          ),
                        ),
                        onTap: () async {
                          if (daerah.text == '') {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("PERHATIAN"),
                                  content: Text(
                                      "Fitur ini hanya berlaku jika terdapat daerah/negara"),
                                );
                              },
                            );
                          } else {
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
                                  tglberangkat =
                                      DateFormat.yMd("id").format(value);
                                  setState(() {});
                                }
                              },
                            );
                          }
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
                        isRequied: false,
                        controlerinputdata: tandaGejala,
                        onChange: (value) {
                          setState(() {});
                        },
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
                            (tandaGejala.text == '')
                                ? "Tgl Awal Gejala"
                                : tglawalgejala ?? "Tgl Awal Gejala",
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey[600]),
                          ),
                          height: 53,
                          padding: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            border: (tandaGejala.text == '')
                                ? Border.all(color: Colors.grey, width: 0)
                                : Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(15),
                            color: (tandaGejala.text == '')
                                ? Colors.grey[300]
                                : Colors.transparent,
                          ),
                        ),
                        onTap: () {
                          if (tandaGejala.text == '') {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("PERHATIAN"),
                                  content: Text(
                                      "Fitur ini hanya berlaku jika terdapat tanda dan gejala"),
                                );
                              },
                            );
                          } else {
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
                                tglawalgejala =
                                    DateFormat.yMd("id").format(value);
                                setState(() {});
                              },
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
                InputData(
                  nama: "Kondisi Umum",
                  hintText: "Masukkan Kondisi Umum",
                  controlerinputdata: kondisiUmum,
                  isRequied: false,
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
                    validator: (value) {
                      if (value == null) {
                        return "Harap di Isi";
                      }
                    },
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
                      setState(() {});
                    },
                    showSearchBox: false,
                  ),
                ),
                (currentKeterangan == null)
                    ? SizedBox()
                    : InputData(
                        hintText: "Catatan Tambahan",
                        controlerinputdata: catatanTambahan,
                        isRequied: false,
                      ),
                (widget.dataCovid == null)
                    ? GestureDetector(
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
                        onTap: () async {
                          print("diklik");
                          if (formkey.currentState.validate()) {
                            print("validate");
                            print(widget.namaAsalUser);
                            isLoading = true;
                            setState(() {});
                            // deklarasi firebase
                            FirebaseFirestore emailFirebase =
                                FirebaseFirestore.instance;

                            // variabel yang nyimpan nama tabel(collaction)
                            CollectionReference data_covid =
                                emailFirebase.collection("data_covid");

                            await data_covid.add({
                              'nama': nama.text,
                              'kecamatan': currentKecamatan,
                              'alamat': alamat.text,
                              'tahun': currentTahun,
                              'bulan': currentBulan,
                              'jenis kelamin': currentjeniskelamin,
                              'hp': nohp.text,
                              'daerah': daerah.text,
                              'tgl berangkat': tglberangkat,
                              'tanda dan gejala': tandaGejala.text,
                              'tgl awal gejala': tglawalgejala,
                              'kondisi umum': kondisiUmum.text,
                              'tata laksanan yang dilakukan': tataLaksana.text,
                              'keterangan': currentKeterangan,
                              'catatan tambahan': catatanTambahan.text,
                              'uploded by id': auth.currentUser.uid,
                              'uploded by nama': widget.namaAsalUser,
                            }).then((value) => Fluttertoast.showToast(
                                msg: "Berhasil di Tambahkan"));
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
                            catatanTambahan.text = "";
                            isLoading = false;
                            setState(() {});
                            Navigator.pop(context);
                          } else {
                            print("not validate");
                          }
                        },
                      )
                    : GestureDetector(
                        onTap: () async {
                          isLoading = true;
                          setState(() {});
                          await FirebaseFirestore.instance
                              .collection("data_covid")
                              .doc(widget.namaAsalUser)
                              .update({
                            'nama': nama.text,
                            'kecamatan': currentKecamatan,
                            'alamat': alamat.text,
                            'tahun': currentTahun,
                            'bulan': currentBulan,
                            'jenis kelamin': currentjeniskelamin,
                            'hp': nohp.text,
                            'daerah': daerah.text,
                            'tgl berangkat': tglberangkat,
                            'tanda dan gejala': tandaGejala.text,
                            'tgl awal gejala': tglawalgejala,
                            'kondisi umum': kondisiUmum.text,
                            'tata laksanan yang dilakukan': tataLaksana.text,
                            'keterangan': currentKeterangan,
                            'catatan tambahan': catatanTambahan.text,
                          }).then((value) {
                            Fluttertoast.showToast(msg: "Berhasil Update");
                            isLoading = true;
                            setState(() {});
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
        ),
      ),
    );
  }
}
