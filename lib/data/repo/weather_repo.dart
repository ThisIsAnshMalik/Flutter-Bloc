import 'package:flutter_bloc_learning/data/data_provider/weather_data_provider.dart';
import 'package:flutter_bloc_learning/data/model/weather_data_model.dart';

class WeatherRepo {
  final weatherDataProvider = WeatherDataProvider();

  Future<WeatherModel> getCurrentWeather(String cityName) async {
    try {
      final res = await weatherDataProvider.getCurrentWeather(cityName);
      return WeatherModel.fromJson(res);
    } catch (e) {
      throw e.toString();
    }
  }
}
