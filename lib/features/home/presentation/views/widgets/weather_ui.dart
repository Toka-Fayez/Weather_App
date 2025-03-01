import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits/weather_cubit/weather_cubit.dart';
import 'temperature_info.dart';
import 'weather_info_row.dart';
import 'forecast_list.dart';
import 'custom_button.dart';

class WeatherUI extends StatelessWidget {
  final dynamic weather;
  final double screenWidth;
  final double screenHeight;

  const WeatherUI({super.key, required this.weather, required this.screenWidth, required this.screenHeight});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: screenHeight * 0.15),
          TemperatureInfo(weather: weather),
          SizedBox(height: screenHeight * 0.05),
          WeatherInfoRow(weather: weather),
          SizedBox(height: screenHeight * 0.02),
          ForecastList(forecast: weather.forecast),
          CustomButton(
            onPressed: () => _showWeatherMessage(context),
          ),
          SizedBox(height: screenHeight * 0.08),
        ],
      ),
    );
  }

  void _showWeatherMessage(BuildContext context) {
    final state = context.read<WeatherCubit>().state;

    if (state is WeatherLoadedState) {
      print("🔥 Prediction: ${state.prediction}");
      print("📌 Features: ${state.features}");
      print("🌤️ WeatherEntity: ${state.weatherEntity}");

      int prediction = state.prediction == 1 ? 1 : 0;

      String message = prediction == 1
          ? "Go out, the weather is fine ☀️"
          : "Stay home today, the weather is not suitable 🚫";

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Weather Advice", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          content: Text(message, style: const TextStyle(fontSize: 16)),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK", style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      );
    } else {
      print("❌ No predictions available");
    }
  }
}