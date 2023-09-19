import '../services/weather_services.dart';

class WeatherRepository {
  WeatherRepository({WeatherService? service})
      : _weatherService = service ?? WeatherService();
  final WeatherService _weatherService;

  Future<Map<String, dynamic>> getWeatherDetails(String query) async {
    return await _weatherService.getWeatherDetails(query);
  }
}
