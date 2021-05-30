import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:menu_login/example/dashboard2.dart';

class BuildButtonShow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //untuk memformat inisial tanggal sesuai negara
    initializeDateFormatting();
    DateTime waktusekarang = DateTime.now();
    //('id') : code negara yg di tuju
    String date = DateFormat.yMMMMd('id').format(waktusekarang);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          child: const Text(
            'Show More Info',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {
            showModalBottomSheet<void>(
              context: context,
              backgroundColor: Colors.transparent,
              builder: (BuildContext context) {
                return Material(
                  elevation: 3,
                  color: Colors.grey[400].withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    margin: EdgeInsets.only(top: 2),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          height: 10,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.grey[600].withOpacity(0.4),
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        Text(
                          "Kasus Covid-19 Terkonfirmasi",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          child: Text(
                            date,
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.blue[900],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        Divider(
                          color: Colors.grey[300],
                          height: 10,
                          thickness: 3,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ListData(
                          kasus: "sembuh",
                          jumlah: 20,
                        ),
                        ListData(
                          kasus: "meninggal",
                          jumlah: 20,
                        ),
                        ListData(
                          kasus: "positif",
                          jumlah: 20,
                        ),
                        ListData(
                          kasus: "dirawat",
                          jumlah: 20,
                        ),
                        ListData(
                          kasus: "tersuspek",
                          jumlah: 20,
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
