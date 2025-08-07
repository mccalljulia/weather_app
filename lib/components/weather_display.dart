import 'package:flutter/material.dart';
import '../models/weather.dart';
import 'package:intl/intl.dart';
import '../utils/icon_mapper.dart';

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
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          // Time
          Text(dateFormat.format(weather.today)),
          // Weather icon
          Image.asset(
            getWeatherIcon(weather.id),
            width: MediaQuery.of(context).size.width * 0.3, // Responsive size
          ),
          SizedBox(height: 10),
          // Description
          Text(weather.description, style: TextStyle(fontSize: 18)),
          // Temperature
          Text(
            '${weather.temperature.toStringAsFixed(0)} °C',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
