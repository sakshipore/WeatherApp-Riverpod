import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherapp_riverpod/src/features/domain/weather_model.dart';

import '../../data/repository/weather_repository.dart';
import '../../data/services/weather_services.dart';
import '../../domain/weather_details_model.dart';

final weatherRepoProvider = Provider((ref) => WeatherRepository());

final weatherProvider = FutureProvider.family((ref, String query) async {
  return await ref.read(weatherRepoProvider).getWeatherDetails(query);
});

class WeatherController {
  Future<Map<String, dynamic>> getWeatherDetails(String query) async {
    // state = const AsyncLoading();
    WeatherService service = WeatherService();
    List<Weather> weather = [];
    WeatherDetails? weatherDetails;
    try {
      Map<String, dynamic> result = await service.getWeatherDetails(query);
      weather = [];
      List<dynamic> weatherList = result['weather'];
      for (Map<String, dynamic> item in weatherList) {
        weather.add(Weather.fromMap(item));
      }
      log(weather[0].description);
      weatherDetails = WeatherDetails.fromMap(result['main']);
      log(weatherDetails.humidity.toString());
      return {
        "weather": weather,
        "weatherDetails": weatherDetails,
      };
    } catch (e) {
      log(e.toString());
      return {};
    }
  }
}

