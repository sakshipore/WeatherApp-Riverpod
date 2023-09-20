import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../controller/weather_controller.dart';

class WeatherScreen extends ConsumerWidget {
  WeatherScreen({super.key});
  final TextEditingController weatherController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(weatherDataProvider);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: weatherController,
                decoration: const InputDecoration(
                  hintText: "Enter the name of the city",
                  enabled: true,
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                ),
                onFieldSubmitted: (value) {
                  ref
                      .read(weatherControllerProvider.notifier)
                      .getWeatherDetails(value);
                },
              ),
              SizedBox(height: 20.h),
              ref.watch(weatherControllerProvider)
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : data.isEmpty
                      ? const Center(
                          child: Text("Enter the name of the city"),
                        )
                      : Column(
                          children: [
                            Text(
                              data['weather'].weather,
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              data['weather'].description,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              "Humidity: ${data['weatherDetails'].humidity}",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              "Tempertaure: ${data['weatherDetails'].temperature}",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              "Pressure: ${data['weatherDetails'].pressure}",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
            ],
          ),
        ),
      ),
    );
  }
}
