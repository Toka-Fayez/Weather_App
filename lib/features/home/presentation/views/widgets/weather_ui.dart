import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'weather_info_tile.dart';
import 'forecast_tile.dart';

class WeatherUI extends StatelessWidget {
  final dynamic weather;
  final double screenWidth;
  final double screenHeight;

  const WeatherUI({
    super.key,
    required this.weather,
    required this.screenWidth,
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: screenHeight * 0.15),
          Center(
            child: Column(
              children: [
                Text(
                  '${weather.currentTemperature}°',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                   weather.condition ?? '',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.05),
          Row(
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
          ),
          SizedBox(height: screenHeight * 0.05),
          Expanded(
            child: ListView.builder(
              itemCount: weather.forecast.length,
              itemBuilder: (context, index) {
                final forecast = weather.forecast[index];

                String formattedDate = "N/A";
                if (forecast.day.isNotEmpty) {
                  try {
                    DateTime parsedDate = DateTime.parse(forecast.day);
                    formattedDate = DateFormat("dd/M").format(parsedDate);
                  } catch (e) {
                    print("Error parsing date: $e");
                  }
                }
                return ForecastTile(
                  day: formattedDate,
                  temperature: '${forecast.temperature}°',
                  condition: forecast.condition,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
