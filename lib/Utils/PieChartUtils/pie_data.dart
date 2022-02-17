import 'package:flutter/material.dart';

// class PieData {
//   static List<DataForPicChart> data = [
//     DataForPicChart(name: 'Blue', percent: 40, color: const Color(0xff0293ee)),
//     DataForPicChart(name: 'Orange', percent: 30, color: const Color(0xfff8b250)),
//     DataForPicChart(name: 'Black', percent: 15, color: Colors.black),
//     DataForPicChart(name: 'Green', percent: 15, color: const Color(0xff13d38e)),
//   ];
// }

class DataForPicChart {
  final String name;

  final double percent;

  final Color color;

  DataForPicChart({this.name, this.percent, this.color});
}
