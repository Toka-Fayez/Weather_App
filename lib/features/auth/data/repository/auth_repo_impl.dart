import 'package:dartz/dartz.dart';
import 'package:weatherapp/core/error/exceptions.dart';
import 'package:weatherapp/core/error/failures.dart';
import 'package:weatherapp/core/services/firebase_auth_service.dart';
import 'package:weatherapp/features/auth/data/model/user_model.dart';
import 'package:weatherapp/features/auth/domain/entities/user_entity.dart';
import 'package:weatherapp/features/auth/domain/repositories/auth_repo.dart';
import 'dart:convert';
import 'dart:developer';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImpl(this.firebaseAuthService);

  @override
  Future<Either<Failures, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
          email: email, password: password);
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}',
      );
      return Left(ServerFailure('An error occurred. please try again later.'));
    }
  }
}
