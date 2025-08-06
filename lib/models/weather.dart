class Weather {
  final int id;
  final String city;
  final String description;
  final double temperature;

  Weather({
    required this.id,
    required this.city,
    required this.description,
    required this.temperature});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      id: json['weather'][0]['id'],
      city: json['name'],
      description: json['weather'][0]['description'],
      temperature: json['main']['temp']
    );
  }
}
