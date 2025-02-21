part of 'location_cubit.dart';

abstract class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object?> get props => [];
}

class LocationInitial extends LocationState {}

class LocationLoadingState extends LocationState {}

class LocationLoadedState extends LocationState {
  final Position position;

  const LocationLoadedState(this.position);

  @override
  List<Object?> get props => [position];
}

class LocationErrorState extends LocationState {
  final String message;

  const LocationErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
