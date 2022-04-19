import 'package:chart_practice/data.dart';
import 'package:flutter/cupertino.dart';

class BarData {
  static int interval = 5;

  static List<Data> barData = [
    Data(id: 0, name: 'Mon', y: 15, color: const Color(0xFF19BFFF)),
    Data(id: 1, name: 'Tue', y: -12, color: const Color(0xFFFF4D94)),
    Data(id: 2, name: 'Wed', y: 11, color: const Color(0xFF2BDB90)),
  ];
}
