class ForecastItem {
  final DateTime dateTime;
  final double temperature;
  ForecastItem({required this.dateTime, required this.temperature});

  static List<ForecastItem> fromJsonList(List<dynamic> list) {
    return list.map((item) => ForecastItem(
      dateTime: DateTime.fromMillisecondsSinceEpoch(item['dt'] * 1000),
      temperature: (item['main']['temp'] as num).toDouble(),
    )).toList();
  }
}
