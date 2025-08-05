import 'package:flutter/material.dart';
import 'package:weather_app/pages/about_page.dart';
import 'package:weather_app/pages/forecast_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int selectedPage = 0;

  final List<Widget> _pageOptions = [
    const HomePage(),
    const ForecastPage(),
    const AboutPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[selectedPage],
      bottomNavigationBar: BottomNavigationBar(        
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Current'),
          BottomNavigationBarItem(icon: Icon(Icons.sunny), label: 'Forecast'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'About'),
        ],
        currentIndex: selectedPage,
        selectedItemColor: Colors.teal,
        onTap: _onItemTapped,
      ),
    );
  }
}
