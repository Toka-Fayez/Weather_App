import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatherapp/features/home/data/models/weather_model.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/services/api_service.dart';
import '../../domain/entities/weather_entity.dart';
import '../../domain/repo/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final ApiService apiService;

  WeatherRepositoryImpl(this.apiService);
  @override
  Future<Either<Failures, Position>> getCurrentLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return Left(LocationServiceFailure('Location services are disabled.'));
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return Left(LocationPermissionFailure(
            'Location permissions are denied',
          ));
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return Left(LocationPermissionFailure(
          'Location permissions are permanently denied, we cannot request permissions.',
        ));
      }

      final position = await Geolocator.getCurrentPosition();
      return Right(position);
    } catch (e) {
      return Left(ServerFailure('Location services are disabled.'));
    }
  }

  @override
  Future<Either<Failures, WeatherEntity>> getWeatherData({
    required double latitude,
    required double longitude,
  }) async {
    try {
      final Map<String, dynamic> data = await apiService.getWeatherData(
        latitude: latitude,
        longitude: longitude,
      );

      final WeatherEntity weatherEntity = WeatherModel.fromJson(data);

      return Right(weatherEntity);
    } catch (e) {
      return Left(ServerFailure('Failed to fetch weather data.'));
    }

    throw UnimplementedError('Weather API call is not yet implemented.');
  }
}
