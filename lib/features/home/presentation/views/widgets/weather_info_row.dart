import 'package:flutter/material.dart';
import 'weather_info_tile.dart';

class WeatherInfoRow extends StatelessWidget {
  final dynamic weather;

  const WeatherInfoRow({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        WeatherInfoTile(
          title: 'Humidity',
          value: '${weather.humidity}%',
          icon: Icons.water_drop,
        ),
        WeatherInfoTile(
          title: 'Rain',
          value: '${(weather.rain * 100).toStringAsFixed(0)}%',
          icon: Icons.cloud,
        ),
        WeatherInfoTile(
          title: 'Wind',
          value: '${weather.windSpeed} km/h',
          icon: Icons.wind_power,
        ),
      ],
    );
  }
}
