import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../controller/weather_controller.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});
  TextEditingController weatherController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ref.watch(weatherProvider(weatherController.text)).when(
                    data: (data) {
                      return Column(
                        children: [
                          TextFormField(
                            controller: weatherController,
                            decoration: const InputDecoration(
                              hintText: "Enter the name of the city",
                              enabled: true,
                              enabledBorder: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            data['weather']['weather'],
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            data['weather']['description'],
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              log(weatherController.toString());

                              // weatherMap.getWeatherDetails(weatherController.text);
                            },
                            child: const Text("Get Weather !"),
                          ),
                        ],
                      );
                    },
                    error: (error, stackTrace) {
                      return const Text("Error while loading data");
                    },
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
