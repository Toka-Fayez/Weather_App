import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/services/weather_prediction_service.dart';
import '../../data/repo/weather_repository_impl.dart';
import '../../domain/repo/weather_repository.dart';
import '../../domain/use_cases/get_weather_use_case.dart';
import '../../domain/use_cases/weather_prediction_use_case.dart';
import '../cubits/weather_cubit/weather_cubit.dart';
import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    ApiService apiService = ApiService();
    WeatherRepository weatherRepository = WeatherRepositoryImpl(apiService);
    GetWeatherUseCase getWeatherUseCase = GetWeatherUseCase(weatherRepository);
    WeatherPredictionService predictionService = WeatherPredictionService(Dio());
    PredictWeatherUseCase predictWeatherUseCase = PredictWeatherUseCase(predictionService);

    return BlocProvider(
      create: (context) => WeatherCubit(
        getWeatherUseCase: getWeatherUseCase,
        predictWeatherUseCase: predictWeatherUseCase,
      ),
      child: const Scaffold(
        body: HomeViewBody(),
      ),
    );
  }
}
