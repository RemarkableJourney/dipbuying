import 'package:dipbuying/models/stock_price_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// const rapidapiApiKey = '108b129491msh13df3bbc30453efp15c11ejsn75bda2c470ba';
const rapidapiApiKey = '06a974e92cmsh42bf2fdc0a45ee3p19fb8ajsn8cd04754999c';
const seekingAlphaBaseUrl = 'https://seeking-alpha.p.rapidapi.com';
const cnbcBaseUrl = 'https://cnbc.p.rapidapi.com';

class ExchangeRateMonitoringData {
  Future<dynamic> getMonitoringPrice() async {
    http.Response response = await http.get(
        Uri.parse(
            'https://currency-conversion-and-exchange-rates.p.rapidapi.com/latest'),
        headers: {
          'x-rapidapi-host':
              'currency-conversion-and-exchange-rates.p.rapidapi.com',
          'x-rapidapi-key': '$rapidapiApiKey'
        });

    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body);
      // print(response.body);
      double data1 = decodedData['rates']['USD'];
      double data2 = decodedData['rates']['KRW'];
      double data = data2 / data1;
      // print(data);

      return data;
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
  }
}

class StoctMarketIndexMonitoringData {
  String stockMarketIndexTickers =
      '599362,579435,593933'; //,5093160'; //,5093151,74542114,601065'; //dia,qqq,soy,us10yr,us2yr,U.S. 2Yr/10Yr Spread,,CBOE Volatility Index

  Future<List<MonitoringPriceModel>> getMonitoringPrice() async {
    http.Response response = await http.get(
        Uri.parse(
            '$cnbcBaseUrl/symbols/get-summary?issueIds=$stockMarketIndexTickers'),
        headers: {
          'x-rapidapi-host': 'cnbc.p.rapidapi.com',
          'x-rapidapi-key': '$rapidapiApiKey'
        });

    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body);
      List<dynamic> data = decodedData['ITVQuoteResult']['ITVQuote'];
      List<MonitoringPriceModel> result = [];
      data.forEach((element) {
        String symbol = element['name'];
        String last = element['last'];
        String change_pct = element['change_pct'];
        MonitoringPriceModel monotoringPriceModel = MonitoringPriceModel(
          symbol: symbol,
          last: last,
          change_pct: change_pct,
        );
        return result.add(monotoringPriceModel);
      });
      return result;
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
  }
}

class InterestRateMonitoringData {
  String InterstRateIndexTickers =
      '5093160,5093151,74542114'; //,601065'; //dia,qqq,soy,us10yr,us2yr,U.S. 2Yr/10Yr Spread,,CBOE Volatility Index

  Future<List<MonitoringPriceModel>> getMonitoringPrice() async {
    http.Response response = await http.get(
        Uri.parse(
            '$cnbcBaseUrl/symbols/get-summary?issueIds=$InterstRateIndexTickers'),
        headers: {
          'x-rapidapi-host': 'cnbc.p.rapidapi.com',
          'x-rapidapi-key': '$rapidapiApiKey'
        });

    // List<dynamic> data = [];
    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body);

      List<dynamic> data = decodedData['ITVQuoteResult']['ITVQuote'];

      List<MonitoringPriceModel> result = [];

      data.forEach((element) {
        String symbol = element['symbol'];
        String last = element['last'];
        String change_pct = element['change_pct'];

        MonitoringPriceModel monotoringPriceModel = MonitoringPriceModel(
          symbol: symbol,
          last: last,
          change_pct: change_pct,
        );
        return result.add(monotoringPriceModel);
      });
      return result;
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
  }
}

class FearIndexMonitoringData {
  String FearIndexTickers =
      '601065,5093151,74542114'; //dia,qqq,soy,us10yr,us2yr,U.S. 2Yr/10Yr Spread,,CBOE Volatility Index

  Future<List<MonitoringPriceModel>> getMonitoringPrice() async {
    http.Response response = await http.get(
        Uri.parse(
            '$cnbcBaseUrl/symbols/get-summary?issueIds=$FearIndexTickers'),
        headers: {
          'x-rapidapi-host': 'cnbc.p.rapidapi.com',
          'x-rapidapi-key': '$rapidapiApiKey'
        });

    // List<dynamic> data = [];
    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body);
      print(decodedData);
      List<dynamic> data = decodedData['ITVQuoteResult']['ITVQuote'];

      List<MonitoringPriceModel> result = [];

      data.forEach((element) {
        String symbol = element['symbol'];
        String last = element['last'];
        String change_pct = element['change_pct'];
        // print(symbol);
        MonitoringPriceModel monotoringPriceModel = MonitoringPriceModel(
          symbol: symbol,
          last: last,
          change_pct: change_pct,
        );
        return result.add(monotoringPriceModel);
      });
      return result;
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
  }
}

class StockDatabaseData {
  String databaseTickers = 'aapl,msft,googl,amzn';
  String databaseTickers1 = 'tsla,nvda,tsm'; //fb
  String databaseTickers2 = 'spy,lvmhf,asml,adbe';
  String databaseTickers3 = 'orcl,dis,nke,nflx';
  String databaseTickers4 = 'mcd,amd,qqq'; //ko
  String databaseTickers5 = 'sbux,abnb,u,o';

  // 'aapl,msft,tsla,fb,nvda,tsm,asml,dis,nflx,amd,o,u,vrm,dia,qqq,spy';

  Future<List<StockPriceModel>> getDatabasePrice() async {
    http.Response response = await http.get(
        Uri.parse(
            '$seekingAlphaBaseUrl/symbols/get-momentum?symbols=$databaseTickers'),
        headers: {
          'x-rapidapi-host': 'seeking-alpha.p.rapidapi.com',
          'x-rapidapi-key': '$rapidapiApiKey'
        });
    http.Response response1 = await http.get(
        Uri.parse(
            '$seekingAlphaBaseUrl/symbols/get-momentum?symbols=$databaseTickers1'),
        headers: {
          'x-rapidapi-host': 'seeking-alpha.p.rapidapi.com',
          'x-rapidapi-key': '$rapidapiApiKey'
        });
    http.Response response2 = await http.get(
        Uri.parse(
            '$seekingAlphaBaseUrl/symbols/get-momentum?symbols=$databaseTickers2'),
        headers: {
          'x-rapidapi-host': 'seeking-alpha.p.rapidapi.com',
          'x-rapidapi-key': '$rapidapiApiKey'
        });
    http.Response response3 = await http.get(
        Uri.parse(
            '$seekingAlphaBaseUrl/symbols/get-momentum?symbols=$databaseTickers3'),
        headers: {
          'x-rapidapi-host': 'seeking-alpha.p.rapidapi.com',
          'x-rapidapi-key': '$rapidapiApiKey'
        });
    http.Response response4 = await http.get(
        Uri.parse(
            '$seekingAlphaBaseUrl/symbols/get-momentum?symbols=$databaseTickers4'),
        headers: {
          'x-rapidapi-host': 'seeking-alpha.p.rapidapi.com',
          'x-rapidapi-key': '$rapidapiApiKey'
        });
    http.Response response5 = await http.get(
        Uri.parse(
            '$seekingAlphaBaseUrl/symbols/get-momentum?symbols=$databaseTickers5'),
        headers: {
          'x-rapidapi-host': 'seeking-alpha.p.rapidapi.com',
          'x-rapidapi-key': '$rapidapiApiKey'
        });
    List<dynamic> data = [];
    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body);
      final decodedData1 = jsonDecode(response1.body);
      final decodedData2 = jsonDecode(response2.body);
      final decodedData3 = jsonDecode(response3.body);
      final decodedData4 = jsonDecode(response4.body);
      final decodedData5 = jsonDecode(response5.body);
      // print(response.body);
      // print(response1.body);

      List<dynamic> data = decodedData['data'] +
          decodedData1['data'] +
          decodedData2['data'] +
          decodedData3['data'] +
          decodedData4['data'] +
          decodedData5['data'];

      // print(data.length);
      // print(data);
      List<StockPriceModel> result = [];

      data.forEach((d) {
        double price = d['attributes']['price'].toDouble();
        double high52 = d['attributes']['high52'].toDouble();
        double movAvg10d = d['attributes']['movAvg10d'].toDouble();
        double movAvg50d = d['attributes']['movAvg50d'].toDouble();
        double movAvg200d = d['attributes']['movAvg200d'].toDouble();
        double dropdown52w = (price - high52) / high52 * 100;
        double movAvg10dRate = (price - movAvg10d) / price * 100;
        double movAvg50dRate = (price - movAvg50d) / price * 100;
        double movAvg200dRate = (price - movAvg200d) / price * 100;

        StockPriceModel stockPriceModel = StockPriceModel(
          id: d['id'],
          movAvg10dRate: movAvg10dRate,
          movAvg50dRate: movAvg50dRate,
          movAvg200dRate: movAvg200dRate,
          high52: high52,
          price: price,
          dropdown52w: dropdown52w,
          count: 0,
        );
        // print(result);
        return result.add(stockPriceModel);
      });

      result.forEach((element) {
        int trueCount = 0;
        if (0 < element.movAvg10dRate && element.movAvg10dRate < 10) {
          trueCount++;
        }
        if (0 < element.movAvg50dRate && element.movAvg50dRate < 15) {
          trueCount++;
        }
        if (0 < element.movAvg200dRate && element.movAvg200dRate < 20) {
          trueCount++;
        }
        if (element.high52 > 10) {
          trueCount++;
        }
        element.count = trueCount;
      });

      result.sort((a, b) => b.count.compareTo(a.count));

      // bool movAvg10IsBiggerThan0 = movAvg10dRate > 0;
      // bool movAvg50IsBiggerThan0 = movAvg50dRate > 0;
      // bool movAvg200IsBiggerThan0 = movAvg200dRate > 0;

      return result;
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
  }
}
