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
   List<int> getWeatherFeatures() {
    return [
      condition.toLowerCase() == "rainy" ? 1 : 0,  //rainy
      condition.toLowerCase() == "sunny" ? 1 : 0,  //sunny
      currentTemperature > 30 ? 1 : 0,             //hot
      (currentTemperature >= 20 && currentTemperature <= 30) ? 1 : 0, //mild
      humidity < 70 ? 1 : 0                        //normal
    ];
  }
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
