import 'package:dipbuying/models/constants.dart';
import 'package:dipbuying/models/stock_price_model.dart';
import 'package:dipbuying/screens/monitoring_screen.dart';
import 'package:dipbuying/screens/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DatabaseScreen extends StatefulWidget {
  @override
  State<DatabaseScreen> createState() => _DatabaseScreenState();
}

class _DatabaseScreenState extends State<DatabaseScreen> {
  bool isLoading = false;

  final List<Widget> databaseTickers = <Widget>[];

  void getData() async {
    try {
      setState(() {
        isLoading = true;
      });
      // databaseData = await StockDatabaseData().getDatabasePrice();

      // data = [StockPriceModel, StockPriceModel]
      setState(() {
        databaseData.forEach((element) {
          Widget newWidget = databaseTickerData(
            tickerName: element.id.toString(),
            // tickerEPS: 1,
            // tickerDY: 1,
            // tickerPE: 1,
            ticker52W: element.dropdown52w.toDouble(),
            tickerMA10: element.movAvg10dRate.toDouble(),
            tickerMA200: element.movAvg200dRate.toDouble(),
            tickerMA50: element.movAvg50dRate.toDouble(),
            // tickerMDD: 1,
          );

          databaseTickers.add(newWidget);
        });
        isLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            DatabaseAppbarTile(appbarTileName: 'Ticker'),
            // DatabaseAppbarTile(appbarTileName: 'EPS'),
            // DatabaseAppbarTile(appbarTileName: 'DY'),
            // DatabaseAppbarTile(appbarTileName: 'PE'),
            DatabaseAppbarTile(appbarTileName: '52W'),
            // DatabaseAppbarTile(appbarTileName: 'MDD'),
            DatabaseAppbarTile(appbarTileName: 'MA20'),
            DatabaseAppbarTile(appbarTileName: 'MA50'),
            DatabaseAppbarTile(appbarTileName: 'MA200'),
          ],
        ),
      ),
      body: isLoading
          ? Center(
              child: SpinKitFadingCircle(
              color: Colors.indigo.shade900,
              size: 40,
            ))
          : ListView.separated(
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              itemCount: databaseTickers.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Container(
                    child: databaseTickers[index],
                  ),
                );
              }),
    );
  }
}
