import 'package:flutter/material.dart';
import 'package:menu_login/widget/constant.dart';

class CustomButton extends StatelessWidget {
  final Function onTapPdf;

  CustomButton({
    this.onTapPdf,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapPdf,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 15),
        width: 200,
        height: 55,
        decoration: BoxDecoration(
          color: primarycolor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.download,
              size: 20,
              color: Colors.white,
            ),
            Text(
              "Download Report",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
