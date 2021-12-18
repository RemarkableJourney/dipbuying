import 'package:dipbuying/controllers/getdata.dart';
import 'package:dipbuying/models/constants.dart';
import 'package:dipbuying/models/stock_price_model.dart';
import 'package:dipbuying/screens/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

List<StockPriceModel> databaseData = [];

class MonitoringScreen extends StatefulWidget {
  const MonitoringScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MonitoringScreen> createState() => _MonitoringScreenState();
}

class _MonitoringScreenState extends State<MonitoringScreen> {
  List<MonitoringPriceModel> stockMarketIndexMonitoringData = [];
  List<MonitoringPriceModel> interestRateMonitoringData = [];
  List<MonitoringPriceModel> fearIndexMonitoringData = [];
  double exchangeRateMonitoringData = 0;

  bool isLoading = false;

  final List<Widget> stockMarketIndexMonitoringTickers = <Widget>[];
  final List<Widget> interestRateMonitoiringTickers = <Widget>[];
  final List<Widget> fearIndexMonitoiringTickers = <Widget>[];

  void getData() async {
    try {
      setState(() {
        isLoading = true;
      });
      stockMarketIndexMonitoringData =
          await StoctMarketIndexMonitoringData().getMonitoringPrice();
      interestRateMonitoringData =
          await InterestRateMonitoringData().getMonitoringPrice();
      exchangeRateMonitoringData =
          await ExchangeRateMonitoringData().getMonitoringPrice();
      fearIndexMonitoringData =
          await FearIndexMonitoringData().getMonitoringPrice();
      databaseData = await StockDatabaseData().getDatabasePrice();

      setState(() {
        for (int i = 0; i < 3; i++) {
          Widget stockMarketIndexList = monitoringTickerData(
            monitoringIndexTitle: stockMarketIndexMonitoringData[i].symbol,
            monitoringIndexValue: stockMarketIndexMonitoringData[i].last,
            monitoringIndexchangeValue:
                stockMarketIndexMonitoringData[i].change_pct,
          );

          stockMarketIndexMonitoringTickers.add(stockMarketIndexList);
        }

        for (int i = 0; i < 3; i++) {
          Widget interestRateIndexList = monitoringTickerData(
            monitoringIndexTitle: interestRateMonitoringData[i].symbol,
            monitoringIndexValue: interestRateMonitoringData[i].last,
            monitoringIndexchangeValue:
                interestRateMonitoringData[i].change_pct,
          );
          interestRateMonitoiringTickers.add(interestRateIndexList);
        }
        Widget fearIndexIndexList = monitoringTickerData(
          monitoringIndexTitle: fearIndexMonitoringData[0].symbol,
          monitoringIndexValue: fearIndexMonitoringData[0].last,
          monitoringIndexchangeValue: fearIndexMonitoringData[0].change_pct,
        );
        fearIndexMonitoiringTickers.add(fearIndexIndexList);

        isLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        // title: SizedBox(width: 40, child: Image.asset('images/flash.png')),
        title: const Text(
          'Dip Buying',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: isLoading
          ? Center(
              child: SpinKitFadingCircle(
              color: Colors.indigo.shade900,
              size: 40,
            ))
          : ListView(
              children: [
                Column(
                  children: [
                    MonitoringTitle(mornitoringTitle: 'Exchange Rate'),
                    Container(
                        child: monitoringTickerData(
                      monitoringIndexTitle: 'USD',
                      monitoringIndexValue: '$exchangeRateMonitoringData',
                      monitoringIndexchangeValue: 'KRW',
                    )),
                  ],
                ),
                Column(
                  children: [
                    MonitoringTitle(mornitoringTitle: 'Stock Market Index'),
                    Column(
                      children: stockMarketIndexMonitoringTickers,
                    )
                  ],
                ),
                Column(
                  children: [
                    MonitoringTitle(mornitoringTitle: 'Interest Rate'),
                    Column(
                      children: interestRateMonitoiringTickers,
                    )
                  ],
                ),
                Column(
                  children: [
                    MonitoringTitle(mornitoringTitle: 'Fear Index'),
                    Column(
                      children: fearIndexMonitoiringTickers,
                    )
                  ],
                ),
              ],
            ),
    );
  }
}
