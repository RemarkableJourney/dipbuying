import 'package:dipbuying/controllers/getdata.dart';
import 'package:dipbuying/models/initialize_model.dart';
import 'package:dipbuying/models/stock_price_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// List<StockPriceModel> databaseData = [];

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    bool lightMode =
        MediaQuery.of(context).platformBrightness == Brightness.light;
    return Scaffold(
      backgroundColor:
          lightMode ? const Color(0xffffffff) : const Color(0xff0f0f0f),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: SizedBox(
              height: 100,
              child: lightMode
                  ? Image.asset('images/flash.png')
                  : Image.asset('images/flash.png'),
            ),
          ),
          Center(
              child: SpinKitFadingCircle(
            color: Colors.indigo.shade900,
            size: 40,
          )),
        ],
      ),
    );
  }
}

class Init {
  Init._();
  static final instance = Init._();
  Future initialize() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!

    await Future.delayed(const Duration(seconds: 1));
  }
}
