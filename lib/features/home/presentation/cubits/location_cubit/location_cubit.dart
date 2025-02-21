import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weatherapp/core/error/failures.dart';
import '../../../../../core/base_case/base_case.dart';
import '../../../domain/use_cases/get_current_location_usecase.dart';
part 'location_state.dart';



class LocationCubit extends Cubit<LocationState> {
  final GetCurrentLocationUseCase getCurrentLocationUseCase;

  LocationCubit({required this.getCurrentLocationUseCase})
      : super(LocationInitial());

  Future<void> getCurrentLocation() async {
    emit(LocationLoadingState());

    final locationResult = await getCurrentLocationUseCase(NoParams());

    locationResult.fold(
      (failure) {
        emit(LocationErrorState(_mapFailureToMessage(failure)));
      },
      (position) {
        emit(LocationLoadedState(position));
      },
    );
  }


  String _mapFailureToMessage(Failures failure) {
    switch (failure.runtimeType) {
      case LocationPermissionFailure:
        return "Location permissions are not granted.";
      case LocationServiceFailure:
        return "Location services are disabled.";
      default:
        return "An unexpected error occurred.";
    }
  }
}

