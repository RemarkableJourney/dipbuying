import 'package:flutter/material.dart';

class StockPriceModel {
  final double movAvg10dRate;
  final double movAvg50dRate;
  final double movAvg200dRate;
  final double high52;
  final double price;
  final String id;
  final double dropdown52w;
  int count;

  StockPriceModel({
    required this.movAvg10dRate,
    required this.movAvg50dRate,
    required this.movAvg200dRate,
    required this.high52,
    required this.price,
    required this.id,
    required this.dropdown52w,
    required this.count,
  });

  // @override
  // String toString() {
  //   return 'movAvg10dRate: $movAvg10dRate, movAvg50dRate: $movAvg50dRate, movAvg200dRate: $movAvg200dRate,high52:$high52,price:$price,dropdown52w:$dropdown52w';
  // }
}

class MonitoringPriceModel {
  final String symbol;
  final String last;
  final String change_pct;

  MonitoringPriceModel({
    required this.symbol,
    required this.last,
    required this.change_pct,
  });
}

class TickerPageModle {}
