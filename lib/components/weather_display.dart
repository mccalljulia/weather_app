import 'package:flutter/material.dart';
import '../models/weather.dart';
import 'package:intl/intl.dart';

class WeatherDisplay extends StatelessWidget {
  final Weather weather;
  final dateFormat = DateFormat('EEE, MMM d, yyyy');
  final timeFormat = DateFormat('HH:mm');

  WeatherDisplay({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // City
          Text(
            weather.city,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          // Time
          Text(
            dateFormat.format(weather.today),
            style: TextStyle(fontSize: 20),
          ),
          Image.network(
            'https://openweathermap.org/img/wn/${weather.iconCode}@2x.png',
            width: 150,
            height: 150,
            fit: BoxFit.contain,
          ),
          // Description
          Text(weather.description, style: TextStyle(fontSize: 20)),
          // Temperature
          Text(
            '${weather.temperature.toStringAsFixed(0)} °C',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          // Feels like temperature
          Text(
            'Feels ${weather.feelsLike.toStringAsFixed(0)} °C',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade800,
            ),
          ),
          SizedBox(height: 20),
          // Sunrise and sunset times
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Image.asset(
                    'assets/images/icons/sunrise_icon.png',
                    width: 50,
                    height: 50,
                  ),
                  Text('Sunrise'),
                  Text(timeFormat.format(weather.sunrise)),
                ],
              ),
              SizedBox(width: 50),
              Column(
                children: [
                  Image.asset(
                    'assets/images/icons/sunset_icon.png',
                    width: 50,
                    height: 50,
                  ),
                  Text('Sunset'),
                  Text(timeFormat.format(weather.sunset)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
