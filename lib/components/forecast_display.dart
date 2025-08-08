import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';
import '../utils/icon_mapper.dart';

class ForecastDisplay extends StatelessWidget {
  ForecastDisplay({super.key});

  final dayFormat = DateFormat('EEE');
  final timeFormat = DateFormat('HH:mm');

  @override
  Widget build(BuildContext context) {
    final forecast = Provider.of<WeatherProvider>(context).forecast;

    if (forecast.isEmpty) return SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '5‑Day Forecast',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: forecast.length,
            itemBuilder: (context, index) {
              final item = forecast[index];
              return AnimatedContainer(
                duration: Duration(milliseconds: 400),
                curve: Curves.easeOut,
                width: 100,
                margin: const EdgeInsets.symmetric(horizontal: 2),  
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      dayFormat.format(item.dateTime),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      timeFormat.format(item.dateTime),
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 8),
                    Image.asset(
                      getWeatherIconByCode(item.iconCode),
                      width: 50,
                      height: 50,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      item.description,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '${item.temperature.toStringAsFixed(0)}°C',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}