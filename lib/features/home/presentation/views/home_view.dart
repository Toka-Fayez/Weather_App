import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/services/api_service.dart';
import '../../data/repo/weather_repository_impl.dart';
import '../../domain/repo/weather_repository.dart';
import '../../domain/use_cases/get_weather_use_case.dart';
import '../cubits/weather_cubit/weather_cubit.dart';
import 'widgets/home_view_body.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
    providers: [
        Provider<ApiService>(
          create: (context) => ApiService(), 
        ),
        Provider<WeatherRepository>(
          create: (context) => WeatherRepositoryImpl(context.read<ApiService>()),
        ),
        Provider<GetWeatherUseCase>(
          create: (context) => GetWeatherUseCase(context.read<WeatherRepository>()),
        ),
        BlocProvider<WeatherCubit>(
          create: (context) => WeatherCubit(getWeatherUseCase: context.read<GetWeatherUseCase>()),
        ),
      ],
      child: const Scaffold(
        body: HomeViewBody(),
      ),
    );
  }
}


