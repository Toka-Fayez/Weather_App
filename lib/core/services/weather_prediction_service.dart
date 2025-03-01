import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../error/failures.dart';

class WeatherPredictionService {
  final Dio dio;

  WeatherPredictionService(this.dio);

 
  Future<Either<Failures, int>> predict(List<int> features) async {
    try {
      print("🚀 Sending Request to ML API with Features: $features");

      final response = await dio.post(
        'http://10.0.2.2:5001/predict', 
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
        data: {"features": features},
      );

      print("✅ API Response: ${response.data}");

      if (response.statusCode == 200) {
        final prediction = response.data["prediction"][0];
        print("🎯 Prediction Result: $prediction");
        return Right(prediction);
      } else {
        print("🔥 API Error: Status Code ${response.statusCode}");
        return Left(
            ServerFailure("Failed with status code: ${response.statusCode}"));
      }
    } catch (e) {
      print("🔥 API Error: $e");
      return Left(ServerFailure("API Error: $e"));
    }
  }
}
