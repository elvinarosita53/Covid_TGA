void main() {
  Map datadamy = {
    'kecamatan bate': {'meninggal': 2, 'positif': 4},
    'kecamatan delima': {'meninggal': 2, 'positif': 4},
    'kecamatan glumpang': {'meninggal': 2, 'positif': 4},
  };

//menggunakan forEach
  datadamy.forEach((kecamatan, isikecamatan) {
    isikecamatan.forEach((kasus, isikasus) {
      print("kecamatan $kecamatan dengan kasus $kasus total data $isikasus");
    });
  });

  List<Map> datadamy2 = [
    {
      'kecamatan bate': {'meninggal': 2, 'positif': 4},
      'kecamatan delima': {'meninggal': 2, 'positif': 4},
      'kecamatan glumpang': {'meninggal': 2, 'positif': 4},
    }
  ];
  print("data list ${datadamy2[0]['kecamatan bate']}");
  print("data list ${datadamy2[0]['kecamatan delima']}");
  print("data list ${datadamy2[0]['kecamatan glumpang']}");
}
