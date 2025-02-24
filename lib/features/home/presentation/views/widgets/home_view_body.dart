import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import '../../cubits/weather_cubit/weather_cubit.dart';
import 'weather_ui.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeViewBody> {
  @override
  void initState() {
    super.initState();
    _initializeWeather();
  }

  Future<void> _initializeWeather() async {
    await _checkLocationPermission(); 

    final position = await Geolocator.getCurrentPosition();
    print("Current Position: $position");
    context.read<WeatherCubit>().getWeatherData(position);
  }

  Future<void> _checkLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        
        print('Location permissions are permanently denied.');
        return;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is WeatherLoadedState) {
          final weather = state.weatherEntity;
          return WeatherUI(
            weather: weather,
            screenWidth: screenWidth,
            screenHeight: screenHeight,
          );
        } else if (state is WeatherErrorState) {
          return Center(
            child: Text(
              state.message,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
