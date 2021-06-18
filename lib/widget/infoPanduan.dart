import 'package:flutter/material.dart';
import 'package:menu_login/widget/constant.dart';

class InfoPanduan extends StatelessWidget {
  final String judulPanduan;

  InfoPanduan({@required this.judulPanduan});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      elevation: 4,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          judulPanduan,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: primarycolor,
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}
