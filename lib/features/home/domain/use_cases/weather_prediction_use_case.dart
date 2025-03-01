import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/services/weather_prediction_service.dart';

class PredictWeatherUseCase {
  final WeatherPredictionService predictionService;

  PredictWeatherUseCase(this.predictionService);

  Future<Either<Failures, int>> call(List<int> features) async {
    try {
      final result = await predictionService.predict(features); 
      return result;
    } catch (e) {
      return Left(ServerFailure("Prediction Error: $e")); 
    }
  }
}


