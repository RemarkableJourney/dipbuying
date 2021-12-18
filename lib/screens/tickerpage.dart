import 'package:dipbuying/controllers/getdata.dart';
import 'package:dipbuying/models/constants.dart';
import 'package:dipbuying/screens/splashscreen.dart';
import 'package:flutter/material.dart';

class TickerPage extends StatefulWidget {
  const TickerPage({Key? key}) : super(key: key);

  @override
  State<TickerPage> createState() => _TickerPageState();
}

class _TickerPageState extends State<TickerPage> {
  bool isLoading = false;

  final List<Widget> tickerPages = <Widget>[];

  void getData() async {
    try {
      setState(() {
        isLoading = true;
      });
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

          tickerPages.add(newWidget);
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
    return Scaffold(
      appBar: AppBar(),
      body: ListView.separated(
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemCount: tickerPages.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: Container(
                child: tickerPages[index],
              ),
            );
          }),
    );
  }
}
