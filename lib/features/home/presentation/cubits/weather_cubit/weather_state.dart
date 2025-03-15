part of 'weather_cubit.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object?> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final WeatherEntity weatherEntity;
  final int prediction;
   final List<int> features;

  const WeatherLoadedState(this.weatherEntity, this.prediction, this.features);

  @override
  List<Object?> get props => [weatherEntity, prediction,features];
}

class WeatherErrorState extends WeatherState {
  final String message;

  const WeatherErrorState(this.message);
  

  @override
  List<Object?> get props => [message];
 
}
