import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatherapp/features/home/domain/entities/weather_entity.dart';
import '../../../../core/error/failures.dart';
abstract class WeatherRepository {
  Future<Either<Failures, Position>> getCurrentLocation();
  Future<Either<Failures, WeatherEntity>> getWeatherData({
    required double latitude,
    required double longitude,
  });
}


