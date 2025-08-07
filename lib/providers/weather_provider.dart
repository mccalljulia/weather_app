import 'package:flutter/material.dart';
import '../models/weather.dart';
import '../models/forecast_item.dart';
import '../services/weather_service.dart';
import '../services/location_service.dart';

class WeatherProvider with ChangeNotifier {
  Weather? _weather;
  bool _isLoading = false;
  final WeatherService _weatherService = WeatherService();
  final LocationService _locationService = LocationService();
  List<ForecastItem> _forecast = [];

  Weather? get weather => _weather;
  bool get isLoading => _isLoading;
  List<ForecastItem> get forecast => _forecast;

  Future<void> fetchForecast(String city) async {
    _forecast = ForecastItem.fromJsonList(data['list']);
    notifyListeners();
  }

  Future<void> fetchWeather(String city) async {
    _isLoading = true;
    notifyListeners();

    try {
      final data = await _weatherService.fetchWeather(city);
      _weather = Weather.fromJson(data);
    } catch (e) {
      _weather = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchWeatherByLatLong(double lat, double lon) async {
    _isLoading = true;
    notifyListeners();

    try {
      final position = await _locationService.getCurrentLocation();
      final lat = position.latitude;
      final lon = position.longitude;
      final data = await _weatherService.fetchWeatherByLatLong(lat, lon);
      _weather = Weather.fromJson(data);
    } catch (e) {
      _weather = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
