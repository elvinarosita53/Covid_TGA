import 'package:flutter/material.dart';

Color kwarna_meninggal = Colors.red;
Color kwarna_sembuh = Colors.blue;
Color kwarna_positif = Colors.yellow;
Color kwarna_dirawat = Colors.green;
Color kwarna_tersuspect = Colors.greenAccent;

var style = TextStyle(
    color: Colors.blue[900], fontSize: 20, fontWeight: FontWeight.bold);

LinearGradient kwarnagradien_meninggal = LinearGradient(
  begin: Alignment.center,
  end: Alignment.bottomCenter,
  colors: [
    Colors.red[300],
    Colors.red[100],
  ],
);
LinearGradient kwarnagradien_sembuh = LinearGradient(
  begin: Alignment.center,
  end: Alignment.bottomCenter,
  colors: [
    Colors.blue[300],
    Colors.blue[100],
  ],
);
LinearGradient kwarnagradien_positif = LinearGradient(
  begin: Alignment.center,
  end: Alignment.bottomCenter,
  colors: [
    Colors.yellow[300],
    Colors.yellow[100],
  ],
);
LinearGradient kwarnagradien_dirawat = LinearGradient(
  begin: Alignment.center,
  end: Alignment.bottomCenter,
  colors: [
    Colors.green[300],
    Colors.green[100],
  ],
);
LinearGradient kwarnagradien_tersuspect = LinearGradient(
  begin: Alignment.center,
  end: Alignment.bottomCenter,
  colors: [
    Colors.greenAccent,
    Colors.greenAccent[100],
  ],
);
