import 'package:flutter/material.dart';
import '../models/weather.dart';

class WeatherDisplay extends StatelessWidget {
  final Weather weather;
  const WeatherDisplay({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          weather.city,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text(weather.description, style: TextStyle(fontSize: 18)),
        Text('${weather.temperature} Celsius', style: TextStyle(fontSize: 24)),
      ],
    );
  }
}
