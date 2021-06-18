import 'package:flutter/material.dart';
import 'package:menu_login/widget/constant.dart';

class CardKesimpulan extends StatelessWidget {
  final String kesimpulanKasus;
  final String judulTextKesimpulan;
  final int total;

  const CardKesimpulan({
    @required this.kesimpulanKasus,
    @required this.judulTextKesimpulan,
    this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              judulTextKesimpulan,
              style: TextStyle(fontSize: 13, color: primarycolor),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: (total != null)
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.center,
              children: (total != null)
                  ? [
                      Text(
                        kesimpulanKasus,
                        style: TextStyle(
                            fontSize: 17,
                            color: primarycolor,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        total.toString(),
                        style: TextStyle(
                            fontSize: 17,
                            color: primarycolor,
                            fontWeight: FontWeight.bold),
                      )
                    ]
                  : [
                      Text(
                        kesimpulanKasus,
                        style: TextStyle(
                            fontSize: 17,
                            color: primarycolor,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
            ),
          ],
        ),
      ),
    );
  }
}
