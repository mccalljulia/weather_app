import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';
import '../components/weather_display.dart';
import '../utils/background_mapper.dart';
import '../components/forecast_display.dart';

class CurrentWeatherPage extends StatefulWidget {
  const CurrentWeatherPage({super.key});

  @override
  State<CurrentWeatherPage> createState() => _CurrentWeatherPageState();
}

class _CurrentWeatherPageState extends State<CurrentWeatherPage> {
  final _cityController = TextEditingController();
  String? locationError;
  bool _showSearchBar = false;

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
      debugPrint('Could not get current location: $e.');
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
          // Background
          if (weather != null)
            Image.asset(
              getBackgroundByCode(weatherProvider.weather!.iconCode),
              fit: BoxFit.cover,
            )
          else
            Container(color: Colors.blue.shade100),

          // Search bar / current location
          if (_showSearchBar)
            Positioned(
              top: 20,
              left: 60,
              right: 60,
              child: Material(
                elevation: 6,
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      TextField(
                        controller: _cityController,
                        decoration: InputDecoration(
                          hintText: 'Enter City',
                          suffixIcon: IconButton(
                            icon: Icon(Icons.search),
                            onPressed: () {
                              final city = _cityController.text.trim();
                              if (city.isNotEmpty) {
                                weatherProvider.fetchWeather(city);
                                _cityController.clear();
                                setState(() => _showSearchBar = false);
                              }
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.blue.shade50.withValues(alpha: 0.8),
                        ),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          _loadCurrentLocationWeather();
                          _cityController.clear();
                          setState(() => _showSearchBar = false);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.shade100,
                          foregroundColor: Colors.blue.shade900,
                          shape: StadiumBorder(),
                        ),
                        child: Text('Current Location'),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          // Weather information
          Positioned.fill(
            top: _showSearchBar ? 140 : 60,
            child: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (weatherProvider.isLoading)
                      const CircularProgressIndicator()
                    // Current weather display
                    else if (weather != null)
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue.shade100.withValues(alpha: 0.3),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white54.withValues(alpha: 0.3),
                              blurRadius: 10,
                              offset: Offset(0, 0),
                            ),
                          ],
                        ),
                        child: WeatherDisplay(weather: weather),
                      )
                    else
                      Text(
                        locationError ??
                            'Could not find your location.\nPlease search for an existing place.',
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                    // Forecast information
                    Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue.shade100.withValues(alpha: 0.3),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white54.withValues(alpha: 0.3),
                              blurRadius: 10,
                              offset: Offset(0, 0),
                            ),
                          ],
                        ),
                        child: ForecastDisplay(),
                      )
                  ],
                ),
              ),
            ),
          ),

          // Floating search icon
          Positioned(
            top: 20,
            right: 20,
            child: FloatingActionButton(
              backgroundColor: Colors.blue.shade50,
              mini: true,
              onPressed: () {
                setState(() => _showSearchBar = !_showSearchBar);
              },
              child: Icon(
                _showSearchBar ? Icons.close : Icons.search,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
