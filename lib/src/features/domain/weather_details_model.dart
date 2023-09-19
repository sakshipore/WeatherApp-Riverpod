class WeatherDetails {
  final double temp;
  final int pressure;
  final int humidity;

  WeatherDetails({
    required this.temp,
    required this.pressure,
    required this.humidity,
  });

  factory WeatherDetails.fromMap(Map<String, dynamic> map) {
    return WeatherDetails(
      temp: map['temp'] ?? 0.0,
      pressure: map['pressure'] ?? 0,
      humidity: map['humidity'] ?? 0,
    );
  }
}
