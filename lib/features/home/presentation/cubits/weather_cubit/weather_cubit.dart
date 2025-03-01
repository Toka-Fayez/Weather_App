import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weatherapp/core/error/failures.dart';
import 'package:geolocator/geolocator.dart';
import '../../../domain/entities/weather_entity.dart';
import '../../../domain/use_cases/get_weather_use_case.dart';
import '../../../domain/use_cases/weather_prediction_use_case.dart';
part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final GetWeatherUseCase getWeatherUseCase;
  final PredictWeatherUseCase predictWeatherUseCase;

  WeatherCubit({
    required this.getWeatherUseCase,
    required this.predictWeatherUseCase,
  }) : super(WeatherInitial());

  Future<void> getWeatherData(Position position) async {
    emit(WeatherLoadingState());

    final weatherResult = await getWeatherUseCase(
      WeatherParams(
        latitude: position.latitude,
        longitude: position.longitude,
      ),
    );

    weatherResult.fold(
      (failure) {
        emit(WeatherErrorState(_mapFailureToMessage(failure)));
      },
      (weather) async {
        print("🌤️ Weather Data: \${weather.currentTemperature}");

        // نحول البيانات إلى Features
        List<int> features = weather.getWeatherFeatures();
        print("Features: \$features");

        try {
          print("🚀 Sending Request to ML API");
          final predictionResult = await predictWeatherUseCase(features);
          print("✅ Prediction Result: \$predictionResult");

          predictionResult.fold(
            (failure) {
              print("🔥 Error in Prediction: \$failure");
              emit(WeatherErrorState(_mapFailureToMessage(failure)));
            },
            (prediction) {
              print("🎯 Prediction Result: \$prediction");
              emit(WeatherLoadedState(weather, prediction, features));
            },
          );
        } catch (e) {
          print("🔥 Error: \$e");
          emit(WeatherErrorState("Failed to predict weather"));
        }
      },
    );
  }
}

String _mapFailureToMessage(Failures failure) {
  return "Failed to load weather data. Please try again.";
}

