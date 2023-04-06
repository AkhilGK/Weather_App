import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather_model.dart';

class WeatherApi {
  Future<WeatherModel>? getCurrentWeather(String? locationIn) async {
    var linkToApi = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$locationIn&appid=b85e71a5e73215f40ce58a0053c5a58b&units=metric");
    var response = await http.get(linkToApi);
    var body = jsonDecode(response.body);
    log(WeatherModel.fromJson(body).cityName.toString());
    return WeatherModel.fromJson(body);
  }
}
