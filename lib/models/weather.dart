class Weather {
  final int id;
  final String city;
  final String description;
  final double temperature;
  final double feelsLike;
  final DateTime today;
  final DateTime sunrise;
  final DateTime sunset;
  final String iconCode;

  Weather({
    required this.id,
    required this.city,
    required this.description,
    required this.temperature,
    required this.feelsLike,
    required this.today,
    required this.sunrise,
    required this.sunset,
    required this.iconCode,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    final int timezoneOffset = json['timezone'];

    DateTime applyOffset(int utcSeconds) {
      return DateTime.fromMillisecondsSinceEpoch(
        utcSeconds * 1000,
        isUtc: true,
      ).add(Duration(seconds: timezoneOffset));
    }

    return Weather(
      id: json['weather'][0]['id'],
      city: json['name'],
      description: json['weather'][0]['description'],
      temperature: json['main']['temp'],
      feelsLike: json['main']['feels_like'],
      today: DateTime.fromMillisecondsSinceEpoch(
        json['dt'] * 1000,
        isUtc: true,
      ),
      sunrise: applyOffset(json['sys']['sunrise']),
      sunset: applyOffset(json['sys']['sunset']),
      iconCode: json['weather'][0]['icon'],
    );
  }
}
