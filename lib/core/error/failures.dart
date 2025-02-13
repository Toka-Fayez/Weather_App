abstract class Failures {
  final String massage;

  Failures( this.massage);
}
class ServerFailure extends Failures{
  ServerFailure(super.massage);

}
