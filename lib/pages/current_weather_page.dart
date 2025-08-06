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
  Future<void> _fetchDefaultWeather() async {
    final weatherProvider = Provider.of<WeatherProvider>(
      context,
      listen: false,
    );
    await weatherProvider.fetchWeather("Stockholm");
  }

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
    } catch (e) {
      debugPrint('Could not get current location: $e');
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchDefaultWeather();
    });
    _loadCurrentLocationWeather();
  }

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);

    return Scaffold(
      body: weatherProvider.weather == null
          ? const Center(
              child: Text('No weather data available for current location'),
            )
          : Stack(
              fit: StackFit.expand,
              children: [
                // Background
                Image.asset(
                  getBackgroundImage(weatherProvider.weather!.id),
                  fit: BoxFit.cover,
                ),
                // Overlay
                Container(color: Colors.black.withOpacity(0.3)),
                // Weather data
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: weatherProvider.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : WeatherDisplay(weather: weatherProvider.weather!),
                ),
              ],
            ),
    );
  }
}
