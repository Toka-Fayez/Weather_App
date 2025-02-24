import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weatherapp/core/error/failures.dart';
import 'package:geolocator/geolocator.dart';
import '../../../domain/entities/weather_entity.dart';
import '../../../domain/use_cases/get_weather_use_case.dart';
part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final GetWeatherUseCase getWeatherUseCase;

  WeatherCubit({required this.getWeatherUseCase}) : super(WeatherInitial());

  Future<void> getWeatherData(Position position) async {
 print("Fetching weather for: ${position.latitude}, ${position.longitude}");  // ✅ تأكد من الإحداثيات

    emit(WeatherLoadingState());
   final weatherResult = await getWeatherUseCase( 
  WeatherParams(
    latitude: position.latitude,
    longitude: position.longitude,
  ),
);

weatherResult.fold(
  (failure) {
  print("Weather API Error: ${failure.toString()}"); 

    emit(WeatherErrorState(_mapFailureToMessage(failure)));
  },
  (weatherData) {
    emit(WeatherLoadedState(weatherData));
  },
);
  }


  String _mapFailureToMessage(Failures failure) {
    return "Failed to load weather data. Please try again.";
  }
}


