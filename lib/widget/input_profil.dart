import 'package:flutter/material.dart';

class InputProfil extends StatelessWidget {
  final TextEditingController controlernama;
  final String nama;
  final String keterangan;
  final bool password;

  // cara cepat nampilin contraktor Ctrl + titik
  InputProfil(
      {@required this.nama,
      @required this.keterangan,
      // agar argumen tdk null
      this.password = false,
      @required this.controlernama});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          nama,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        TextField(
          //agar password gak sensor **
          obscureText: password,
          controller: controlernama,
          decoration: InputDecoration(
            hintText: keterangan,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          ),
        )
      ],
    );
  }
}
