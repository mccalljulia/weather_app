import 'package:flutter/material.dart';
import '../models/weather.dart';
import 'package:intl/intl.dart';

class WeatherDisplay extends StatelessWidget {
  final Weather weather;
  final dateFormat = DateFormat('EEEE, MMM d, yyyy');
  final timeFormat = DateFormat('hh:mm a');

  WeatherDisplay({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          weather.city,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text(dateFormat.format(weather.today)),
        Text(weather.description, style: TextStyle(fontSize: 18)),
        Text('${weather.temperature} Celsius', style: TextStyle(fontSize: 24)),
        SizedBox(height: 20),
        Text('Sunrise: ${timeFormat.format(weather.sunrise)}'),
        Text('Sunset: ${timeFormat.format(weather.sunset)}'),
      ],
    );
  }
}
