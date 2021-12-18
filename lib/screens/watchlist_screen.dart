import 'package:dipbuying/models/constants.dart';
import 'package:dipbuying/screens/database_screen.dart';
import 'package:dipbuying/screens/monitoring_screen.dart';
import 'package:dipbuying/screens/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class WatchlistScreen extends StatefulWidget {
  @override
  State<WatchlistScreen> createState() => _WatchlistScreenState();
}

class _WatchlistScreenState extends State<WatchlistScreen> {
  bool isLoading = false;

  final List<Widget> watchListTickers = <Widget>[];

  void getData() async {
    try {
      setState(() {
        isLoading = true;
      });

      setState(() {
        databaseData.forEach((element) {
          Widget newWidget = WatchListTickerData(
            tickerName: element.id,
            tickerBDScore: element.count.toString(),
            tickerPrice: element.price.toString(),
            tickerHigh: element.high52.toString(),
          );

          watchListTickers.add(newWidget);
        });
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
    // print('build');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            watchListAppbarTile(appbarTileName: 'Ticker'),
            watchListAppbarTile(appbarTileName: 'High'),
            watchListAppbarTile(appbarTileName: 'Price'),
            watchListAppbarTile(appbarTileName: 'Score'),
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
              itemCount: watchListTickers.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: watchListTickers[index],
                  // child:
                );
              }),
      floatingActionButton: FlatButton(
        minWidth: 10,
        child: const Text(
          'Add',
          style: TextStyle(color: Colors.white),
        ),
        color: Colors.black38,
        onPressed: () {
          '1';
        },
      ),
    );
  }
}
