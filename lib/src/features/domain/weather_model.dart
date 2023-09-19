class Weather {
  final String weather;
  final String description;

  Weather({
    required this.weather,
    required this.description,
  });

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      weather: map['main'] ?? "", 
      description: map['description'] ?? "",
    );
  }
}
