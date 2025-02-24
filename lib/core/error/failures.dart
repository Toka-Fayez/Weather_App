abstract class Failures {
  final String massage;

  Failures( this.massage);
}
class ServerFailure extends Failures{
  ServerFailure(super.massage);

}
class LocationFailure extends Failures {
  LocationFailure(super.massage);

}
class LocationPermissionFailure extends Failures {
  LocationPermissionFailure(super.massage);
}

class LocationServiceFailure extends Failures {
  LocationServiceFailure(super.massage);
}