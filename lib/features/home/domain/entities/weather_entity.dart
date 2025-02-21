class WeatherEntity {
  final double currentTemperature;
  final num rain;
  final num humidity;
  final num windSpeed;
  final String condition;
  final List<ForecastEntity> forecast;

  WeatherEntity({
    required this.currentTemperature,
    required this.rain,
    required this.humidity,
    required this.windSpeed,
    required this.condition,
    required this.forecast,
  });
}

class ForecastEntity {
  final String day;
  final double temperature;
  final String condition;

  ForecastEntity({
    required this.day,
    required this.temperature,
    required this.condition,
  });
}
