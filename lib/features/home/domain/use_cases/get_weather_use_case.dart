import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/weather_entity.dart';
import '../repo/weather_repository.dart';


class GetWeatherUseCase {
  final WeatherRepository repository;

  GetWeatherUseCase(this.repository);

  Future<Either<Failures, WeatherEntity>> call(WeatherParams params) async {
    return await repository.getWeatherData(
      latitude: params.latitude,
      longitude: params.longitude,
    );
  }
}

class WeatherParams {
  final double latitude;
  final double longitude;

  WeatherParams({required this.latitude, required this.longitude});
}
