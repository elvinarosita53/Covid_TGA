import 'package:flutter/material.dart';

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
            // contentPadding: EdgeInsets.symmetric(horizontal: 10),
            isDense: true,
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
