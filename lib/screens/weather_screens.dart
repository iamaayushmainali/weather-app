import 'package:flutter/material.dart';
import 'package:weather_app/widgets/temperature_display.dart';
import 'package:weather_app/widgets/weather_icon.dart';
import 'package:weather_app/screens/weather_loading_animation.dart';
import 'package:weather_app/service/location_service.dart';
import 'package:weather_app/models/weather_model.dart';

import '../service/weather_service.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/build_top_bar.dart';

class WeatherScreens extends StatefulWidget {
  const WeatherScreens({super.key});

  @override
  State<WeatherScreens> createState() => _WeatherScreensState();
}

class _WeatherScreensState extends State<WeatherScreens> {
  WeatherModel? weather;
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  Future<void> getLocation() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    final location = LocationService();
    final weatherdata = WeatherService();

    try {
      double lat = 27.7172; // default latitude
      double lon = 85.3240; // default longtitude

      try {
        final position = await location.getCurrentLocation();
        lat = position.latitude;
        lon = position.longitude;
        print('Latitude: $lat, Longitude: $lon');
      } catch (locationError) {
        print(
          'Location permission/GPS unavailable, using default coordinates: $locationError',
        );
      }

      final weatherData = await weatherdata.getWeather(
        latitude: lat,
        longitude: lon,
      );

      setState(() {
        weather = weatherData;
        isLoading = false;
      });

      print('Weather fetched successfully for ${weatherData.cityName}!');
    } catch (e) {
      print('Error fetching weather: $e');
      setState(() {
        errorMessage = e.toString().replaceAll('Exception: ', '');
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF38B2FF), Color(0xFF007BF5)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 12.0,
            ),
            child: isLoading
                ? const WeatherLoadingAnimation()
                : errorMessage != null
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.error_outline_rounded,
                          color: Colors.white,
                          size: 48,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          errorMessage!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: getLocation,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: const Color(0xFF007BF5),
                          ),
                          child: const Text('Try Again'),
                        ),
                      ],
                    ),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BuildTopBar(cityName: weather?.cityName ?? 'Unknown'),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const WeatherIcon(),
                          const SizedBox(height: 10),
                          TemperatureDisplay(
                            condition: weather?.condition ?? 'N/A',
                            temperature: weather?.temperature ?? 0,
                          ),
                        ],
                      ),
                      BottomBar(
                        windSpeed: weather?.windSpeed ?? 0,
                        humidity: weather?.humidity ?? 0,
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
