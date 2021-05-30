import 'package:flutter/material.dart';

class Kosong extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image(
              height: 300,
              width: 300,
              //untuk menyesuaikan dengan layar (mis. setengah dari layar)
              // height: MediaQuery.of(context).size.width / 2,
              // width: MediaQuery.of(context).size.width / 2,
              image: AssetImage("images/flu.png"),
            ),
          ],
        ),
      ),
    );
  }
}
