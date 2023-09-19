import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../utils/app_utils.dart';

class WeatherService {
  Future<Map<String, dynamic>> getWeatherDetails(String query) async {
    String url =
        "https://api.openweathermap.org/data/2.5/weather?q=$query&appid=${AppUtils.weatherKey}";
    var response = await Dio().getUri(
      Uri.parse(url),
    );
    // log(response.data.toString());
    
    return response.data;
  }
}
