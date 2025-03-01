import 'package:flutter/material.dart';

class TemperatureInfo extends StatelessWidget {
  final dynamic weather;

  const TemperatureInfo({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
