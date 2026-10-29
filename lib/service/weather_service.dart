import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class WeatherService {
  final String apikey = dotenv.env["OPENWEATHER_API_KEY"] ?? '';

  Future<WeatherModel> getWeather({
    required double latitude,
    required double longitude,
  }) async {
    final url = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apikey&units=metric',
    );

    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception('Failed to fetch weather');
    }

    final data = json.decode(response.body);

    final weather = WeatherModel.fromJson(data);
    return weather;
  }
}
