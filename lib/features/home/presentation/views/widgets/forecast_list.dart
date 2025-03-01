import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'forecast_tile.dart';

class ForecastList extends StatelessWidget {
  final List<dynamic> forecast;

  const ForecastList({super.key, required this.forecast});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: forecast.length,
        itemBuilder: (context, index) {
          final forecastItem = forecast[index];

          String formattedDate = "N/A";
          if (forecastItem.day.isNotEmpty) {
            try {
              DateTime parsedDate = DateTime.parse(forecastItem.day);
              formattedDate = DateFormat("dd/M").format(parsedDate);
            } catch (e) {
              print("Error parsing date: $e");
            }
          }

          return ForecastTile(
            day: formattedDate,
            temperature: '${forecastItem.temperature}°',
            condition: forecastItem.condition,
          );
        },
      ),
    );
  }
}