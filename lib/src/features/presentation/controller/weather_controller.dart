import 'dart:async';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherapp_riverpod/src/features/domain/weather_model.dart';

import '../../data/services/weather_services.dart';
import '../../domain/weather_details_model.dart';

final weatherControllerProvider =
    StateNotifierProvider<WeatherController, bool>((ref) {
  return WeatherController(false, ref: ref);
});

final weatherDataProvider = StateProvider<Map<String, dynamic>>((ref) => {});

class WeatherController extends StateNotifier<bool> {
  WeatherService service = WeatherService();
  Ref ref;
  WeatherController(super.state, {required this.ref});

  Future<void> getWeatherDetails(String query) async {
    Weather? weather;
    WeatherDetails? weatherDetails;
    state = true;
    try {
      Map<String, dynamic> result = await service.getWeatherDetails(query);
      List<dynamic> weatherList = result['weather'];
      for (Map<String, dynamic> item in weatherList) {
        weather = Weather.fromMap(item);
      }
      log(weather!.description);
      weatherDetails = WeatherDetails.fromMap(result['main']);
      log(weatherDetails.humidity.toString());
      final res = {
        "weather": weather,
        "weatherDetails": weatherDetails,
      };
      ref.read(weatherDataProvider.notifier).update((state) => res);
      state = false;
    } catch (e) {
      log(e.toString());
    }
  }
}
