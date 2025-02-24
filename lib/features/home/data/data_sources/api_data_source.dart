import 'package:dio/dio.dart';

class WeatherApiDataSource {
  final Dio _dio = Dio();
  final String apiKey = 'd4a1b7fb20f94ae795054841241509';

  Future<Map<String, dynamic>> getWeatherData({
    required double latitude,
    required double longitude,
  }) async {
    const String baseUrl = 'https://api.openweathermap.org/data/2.5/forecast';

    final response = await _dio.get(baseUrl, queryParameters: {
      'lat': latitude,
      'lon': longitude,
      'appid': apiKey,
      'units': 'metric',
    });

    return response.data;
  }
}
