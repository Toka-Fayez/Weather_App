import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> getWeatherData({
    required double latitude,
    required double longitude,
  }) async {
    const String apiKey = 'd4a1b7fb20f94ae795054841241509';
    const String baseUrl = 'https://api.weatherapi.com/v1/forecast.json';

    try {
      final response = await _dio.get(baseUrl, queryParameters: {
        'key': apiKey,
        'q': '$latitude,$longitude', 
        'days': 3, 
        'units': 'metric', 
      });

      print("Weather API Response: ${response.data}"); 
      return response.data;
    } catch (e) {
      print("Weather API Error: $e");
      throw Exception("Failed to fetch weather data");
    }
  }
}

