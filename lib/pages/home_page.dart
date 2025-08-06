import 'package:flutter/material.dart';
import 'package:weather_app/pages/about_page.dart';
import 'package:weather_app/pages/forecast_page.dart';
import 'package:weather_app/pages/current_weather_page.dart';
import 'package:weather_app/pages/search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int selectedPage = 0;

  final List<Widget> _pageOptions = [
    const CurrentWeatherPage(),
    const ForecastPage(),
    const SearchPage(),
    const AboutPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("HomePage is building..."); // debug
    return Scaffold(
      body: _pageOptions[selectedPage],
      bottomNavigationBar: BottomNavigationBar(    
        backgroundColor: Colors.teal.shade50,    
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Current'),
          BottomNavigationBarItem(icon: Icon(Icons.sunny), label: 'Forecast'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'About'),
        ],
        currentIndex: selectedPage,
        selectedItemColor: Colors.teal,
        onTap: _onItemTapped,
      ),
    );
  }
}
