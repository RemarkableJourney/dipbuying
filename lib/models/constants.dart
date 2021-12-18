import 'package:flutter/material.dart';

//mornitoringscreen Listview title widge
class MonitoringTitle extends StatelessWidget {
  MonitoringTitle({required this.mornitoringTitle});
  String mornitoringTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      color: Colors.black26,
      padding: EdgeInsets.all(12),
      child: Text(
        mornitoringTitle,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );
  }
}

//mornitoringscreen Listview tile widge
class monitoringTickerData extends StatelessWidget {
  monitoringTickerData(
      {required this.monitoringIndexTitle,
      required this.monitoringIndexValue,
      required this.monitoringIndexchangeValue});
  String monitoringIndexTitle;
  String monitoringIndexValue;
  String monitoringIndexchangeValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 48,
            color: Colors.black12,
            padding: EdgeInsets.all(15),
            child: Text(
              '$monitoringIndexTitle',
              style: TextStyle(fontSize: 15),
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 48,
            color: Colors.black12,
            padding: EdgeInsets.all(15),
            child: Text(
              '$monitoringIndexValue',
              style: TextStyle(fontSize: 15),
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 48,
            color: Colors.black12,
            padding: EdgeInsets.all(15),
            child: Text(
              '$monitoringIndexchangeValue',
              style: TextStyle(fontSize: 15),
            ),
          ),
        ),
      ],
    );
  }
}

//watchListScreen Listview Title widge
class watchListAppbarTile extends StatelessWidget {
  watchListAppbarTile({required this.appbarTileName});
  String appbarTileName;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // flex: 2,
      child: Text(appbarTileName,
          softWrap: true,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          )),
    );
  }
}

//watchListScreen Listview contents widge
class WatchListTickerData extends StatelessWidget {
  WatchListTickerData({
    required this.tickerName,
    required this.tickerHigh,
    required this.tickerPrice,
    required this.tickerBDScore,
  });
  final String tickerName;
  final String tickerHigh;
  final String tickerPrice;
  final String tickerBDScore;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        watchListIndexTile(watchlistTickerIndex: tickerName),
        watchListIndexTile(watchlistTickerIndex: tickerHigh),
        watchListIndexTile(watchlistTickerIndex: tickerPrice),
        watchListIndexTile(watchlistTickerIndex: tickerBDScore),
      ],
    );
  }
}

//watchListScreen Listview tile widge
class watchListIndexTile extends StatelessWidget {
  const watchListIndexTile({
    Key? key,
    required this.watchlistTickerIndex,
  }) : super(key: key);

  final String watchlistTickerIndex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        '$watchlistTickerIndex',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
    );
  }
}

//DadtabaseScreen Listview Title widge
class DatabaseAppbarTile extends StatelessWidget {
  DatabaseAppbarTile({required this.appbarTileName});
  String appbarTileName;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // flex: 2,
      child: Text(appbarTileName,
          softWrap: true,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          )),
    );
  }
}

//DadtabaseScreen Listview contents widge
class databaseTickerData extends StatelessWidget {
  databaseTickerData({
    required this.tickerName,
    // required this.tickerEPS,
    // required this.tickerDY,
    // required this.tickerPE,
    required this.ticker52W,
    required this.tickerMA10,
    required this.tickerMA200,
    required this.tickerMA50,
    // required this.tickerMDD,
  });
  String tickerName;
  // double tickerEPS;
  // double tickerDY;
  // double tickerPE;
  double ticker52W;
  // double tickerMDD;
  double tickerMA200;
  double tickerMA50;
  double tickerMA10;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Expanded(
        //   child: Text(
        //     tickerName,
        //     textAlign: TextAlign.center,
        //     style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        //   ),
        // ),
        databaseIndexTile(databaseTickerIndex: tickerName),
        // databaseIndexTile(databaseTickerIndex: tickerEPS),
        // databaseIndexTile(databaseTickerIndex: tickerDY),
        // databaseIndexTile(databaseTickerIndex: tickerPE),
        databaseIndexTile(
            databaseTickerIndex: ticker52W.toStringAsFixed(1) + '%'),
        // databaseIndexTile(databaseTickerIndex: tickerMDD),
        databaseIndexTile(
            databaseTickerIndex: tickerMA10.toStringAsFixed(1) + '%'),
        databaseIndexTile(
            databaseTickerIndex: tickerMA50.toStringAsFixed(1) + '%'),
        databaseIndexTile(
            databaseTickerIndex: tickerMA200.toStringAsFixed(1) + '%'),
      ],
    );
  }
}

//DadtabaseScreen Listview tile widge
class databaseIndexTile extends StatelessWidget {
  const databaseIndexTile({
    Key? key,
    required this.databaseTickerIndex,
  }) : super(key: key);

  final dynamic databaseTickerIndex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            border: Border(right: BorderSide(width: 1.0, color: Colors.grey))),
        child: Text(
          '$databaseTickerIndex',
          textAlign: TextAlign.center,
          maxLines: 1,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.clip,
          ),
        ),
      ),
    );
  }
}
