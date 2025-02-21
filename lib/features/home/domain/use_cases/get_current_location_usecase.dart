import 'package:dartz/dartz.dart';
import 'package:weatherapp/core/error/failures.dart';

import '../../../../core/base_case/base_case.dart';
import 'package:geolocator/geolocator.dart';
import '../repo/weather_repository.dart';


class GetCurrentLocationUseCase extends BaseUseCase<Either<Failures, Position>, NoParams> {
  final WeatherRepository repository;

  GetCurrentLocationUseCase(this.repository);

  @override
  Future<Either<Failures, Position>> call(NoParams params) async {
    return await repository.getCurrentLocation();
  }
}

