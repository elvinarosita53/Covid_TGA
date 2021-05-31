import 'package:flutter/material.dart';
import 'package:menu_login/page/page_dashboard.dart';
import 'package:menu_login/page/page_formInput.dart';

class GetStart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigoAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            width: 350,
            image: AssetImage("images/flu.png"),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Covid - 19",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              "Corona Virus merupakan keluarga besar virus yang menyebabkan penyakit ringan sampai berat, seperti common cold atau pilek dan penyakit yang serius seperti MERS dan SARS",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontStyle: FontStyle.italic),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          //bagian melihat halaman selanjutnya
          InkWell(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PageDashboard(),
                  ));
            },
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "Get Start",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.indigoAccent,
                    fontWeight: FontWeight.bold),
              ),
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
