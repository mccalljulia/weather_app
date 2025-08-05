import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';

class CurrentWeatherPage extends StatefulWidget {
  const CurrentWeatherPage({super.key});

  @override
  State<CurrentWeatherPage> createState() => _CurrentWeatherPageState();
}

class _CurrentWeatherPageState extends State<CurrentWeatherPage> {
  final _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _cityController,
              decoration: InputDecoration(
                labelText: 'Enter City',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    print("Fetching weather for: ${_cityController.text}");
                    weatherProvider.fetchWeather(_cityController.text);
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            weatherProvider.isLoading
                ? CircularProgressIndicator()
                : weatherProvider.weather == null
                ? Text("No Data")
                : Column(
                    children: [
                      Text(
                        weatherProvider.weather!.city,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        weatherProvider.weather!.description,
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        '${weatherProvider.weather!.temperature} Celsius',
                        style: TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }
}
