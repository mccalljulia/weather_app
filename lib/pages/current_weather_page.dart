import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';
import '../components/weather_display.dart';
import '../utils/background.dart';

class CurrentWeatherPage extends StatefulWidget {
  const CurrentWeatherPage({super.key});

  @override
  State<CurrentWeatherPage> createState() => _CurrentWeatherPageState();
}

class _CurrentWeatherPageState extends State<CurrentWeatherPage> {
  final _cityController = TextEditingController();
  String? locationError;

  Future<void> _loadCurrentLocationWeather() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      double lat = position.latitude;
      double lon = position.longitude;
      final weatherProvider = Provider.of<WeatherProvider>(
        context,
        listen: false,
      );
      await weatherProvider.fetchWeatherByLatLong(lat, lon);
      setState(() {
        locationError = null;
      });
    } catch (e) {
      debugPrint('Could not get current location: $e. Please search a city.');
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Location error: $e')));
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _loadCurrentLocationWeather();
  }

  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);
    final weather = weatherProvider.weather;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SizedBox(height: 20),
          // Background
          if (weather != null)
            Image.asset(
              getBackgroundImage(weatherProvider.weather!.id),
              fit: BoxFit.cover,
            )
          else
            Container(color: Colors.grey.shade200),
          // Overlay
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // Search box
                  TextField(
                    controller: _cityController,
                    decoration: InputDecoration(
                      labelText: 'Enter City',
                      suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          final city = _cityController.text.trim();
                          if (city.isNotEmpty) {
                            weatherProvider.fetchWeather(_cityController.text);
                            _cityController.clear();
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Current location button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade50,
                      ),
                    onPressed: () {
                      _loadCurrentLocationWeather();
                      _cityController.clear();
                    },
                    child: Text(
                      'Current location',
                      style: TextStyle(
                        color: Colors.blue.shade900,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Weather info container
                  Expanded(
                    child: Center(
                      child: weatherProvider.isLoading
                          ? const CircularProgressIndicator()
                          : weather != null
                          ? Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.blue.shade100.withValues(
                                  alpha: 0.2,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white54.withValues(
                                      alpha: 0.4,
                                    ),
                                    blurRadius: 10,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                              ),
                              width: MediaQuery.of(context).size.width * 0.85,
                              height: MediaQuery.of(context).size.height * 0.85,
                              child: WeatherDisplay(weather: weather),
                            )
                          : Text(
                              locationError ??
                                  'Invalid location. Please try again',
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
