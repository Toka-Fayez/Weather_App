import 'package:get_it/get_it.dart';
import 'package:weatherapp/core/services/firebase_auth_service.dart';
import 'package:weatherapp/features/auth/data/repository/auth_repo_impl.dart';
import 'package:weatherapp/features/auth/domain/repositories/auth_repo.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(
     getIt<FirebaseAuthService>(),
  ));



}