class ForecastItem {
  final DateTime dateTime;
  final double temperature;
  final String description;
  final String iconCode;

  ForecastItem({
    required this.dateTime,
    required this.temperature,
    required this.description,
    required this.iconCode,
  });

  static List<ForecastItem> fromJsonList(List<dynamic> list) {
    final forecastList = list
        .map(
          (item) => ForecastItem(
            dateTime: DateTime.fromMillisecondsSinceEpoch(item['dt'] * 1000),
            temperature: (item['main']['temp'] as num).toDouble(),
            description: item['weather'][0]['description'],
            iconCode: item['weather'][0]['icon'],
          ),
        )
        .toList();
    return forecastList;
  }
}
