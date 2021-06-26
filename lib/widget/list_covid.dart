import 'package:flutter/material.dart';
import 'package:menu_login/page/page_formInput.dart';
import 'package:menu_login/widget/constant.dart';

class ListCovid extends StatefulWidget {
  final String uplodedBy;
  final String nama;
  final String keterangan_kasus;
  final Function onHapus;
  final Function onFormInput;

  const ListCovid(
      {this.uplodedBy,
      this.nama = "Nama",
      this.keterangan_kasus = "Keterangan Kasus",
      this.onHapus,
      this.onFormInput});

  @override
  _ListCovidState createState() => _ListCovidState();
}

class _ListCovidState extends State<ListCovid> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onFormInput,
      child: Container(
        height: 80,
        // width: 200,
        // margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 5,
              spreadRadius: 2,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.nama,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  widget.keterangan_kasus,
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
                (widget.uplodedBy == null)
                    ? SizedBox()
                    : SizedBox(
                        width: MediaQuery.of(context).size.width - 80,
                        child: Text(
                          widget.uplodedBy ?? '',
                          style: TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                      ),
              ],
            ),
            IconButton(
              onPressed: widget.onHapus,
              icon: Icon(
                Icons.delete,
                color: primarycolor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
