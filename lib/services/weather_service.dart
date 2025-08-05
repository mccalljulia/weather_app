import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  final String apiKey = '69d9744ab671eda4150e50b3f7e5e2f0';
  final String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  Future<Map<String, dynamic>> fetchWeather(String city) async {
    final response = await http.get(Uri.parse('$baseUrl?q=$city&appid=$apiKey&units=metric'));
    
    // if there is a response, decode the json object. otherwise, throw exception
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to load weather data.");
    }
  }
}
