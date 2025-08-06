import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class WeatherService {
  final String apiKey = dotenv.env['API_KEY']!;
  final String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  Future<Map<String, dynamic>> fetchWeather(String city) async {
    final responseCity = await http.get(Uri.parse('$baseUrl?q=$city&appid=$apiKey&units=metric'));
    
    if (responseCity.statusCode == 200) {
      return jsonDecode(responseCity.body);
    } else {
      throw Exception("Failed to fetch weather data for searched location");
    }
  }

  Future<Map<String, dynamic>> fetchWeatherByLatLong(double lat, double lon) async {
    final responseLatLong = await http.get(Uri.parse('$baseUrl?lat=$lat&lon=$lon&appid=$apiKey&units=metric'));
    if (responseLatLong.statusCode == 200) {
      return jsonDecode(responseLatLong.body);
    } else {
      throw Exception('Failed to fetch weather data for current location');
    }
  }
}
