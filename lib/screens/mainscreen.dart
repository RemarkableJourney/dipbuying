import 'package:dipbuying/screens/database_screen.dart';
import 'package:dipbuying/screens/monitoring_screen.dart';
import 'package:dipbuying/screens/watchlist_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    MonitoringScreen(),
    WatchlistScreen(),
    DatabaseScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Monitoring',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'WatchList',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud),
            label: 'DataBase',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.indigo.shade900,
        onTap: _onItemTapped,
      ),
    );
  }
}
