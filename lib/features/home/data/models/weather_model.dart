import '../../domain/entities/weather_entity.dart';

class WeatherModel extends WeatherEntity {
  WeatherModel({
    required double currentTemperature,
    required num rain,
    required num humidity,
    required num windSpeed,
    required String condition,
    required List<ForecastModel> forecast,
  }) : super(
          currentTemperature: currentTemperature,
          rain: rain,
          humidity: humidity,
          windSpeed: windSpeed,
          condition: condition,
          forecast: forecast,
        );

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      currentTemperature: json['current']['temp_c'],
      rain: json['current']['precip_mm'],
      humidity: json['current']['humidity'],
      windSpeed: json['current']['wind_kph'],
      condition: json['current']['condition']['text'],
      forecast: (json['forecast']['forecastday'] as List<dynamic>)
          .map((day) => ForecastModel.fromJson(day))
          .toList(),
    );
  }
}

class ForecastModel extends ForecastEntity {
  ForecastModel({
    required String day,
    required double temperature,
    required String condition,
  }) : super(
          day: day,
          temperature: temperature,
          condition: condition,
        );

  factory ForecastModel.fromJson(Map<String, dynamic> json) {
    return ForecastModel(
      day: json['date'],
      temperature: json['day']['avgtemp_c'],
      condition: json['day']['condition']['text'],
    );
  }
}


