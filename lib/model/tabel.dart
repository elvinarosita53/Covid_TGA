import 'package:flutter/foundation.dart';
import 'package:menu_login/model/kecamatans.dart';

class TabelItem {
  final String keterangan;
  // final List<int> jumlahTiapkecamatan;
  final Kecamatans kecamatans;

  TabelItem({
    @required this.keterangan,
    // @required this.jumlahTiapkecamatan,
    @required this.kecamatans,
  });
}

class Tabel {
  final List<TabelItem> items;

  Tabel({@required this.items});
}
