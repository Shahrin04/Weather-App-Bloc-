import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/config/valuables.dart';
import 'package:weather_app/data/models/weather_model.dart';

class WeatherRepo {
  Future<WeatherModel> getWeather(String city) async {
    final result = await http.Client().get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$APPID'));

    if (result.statusCode != 200) throw Exception('status code is not 200');

    return parsedJson(result.body);
  }
  Future<WeatherModel> parsedJson(final response) async {
    final jsonDecoded = json.decode(response);
    final jsonWeather = jsonDecoded['main'];

    return WeatherModel.fromJson(jsonWeather);
  }
}
