import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/user_entity.dart';
import '../../../domain/repositories/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
   final AuthRepo authRepo;

  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    var result = await authRepo.signinWithEmailAndPassword(
      email,
      password,
    );
    result.fold(
      (failure) => emit(
        LoginFailure(message: failure.massage),
      ),
      (userEntity) => emit(LoginSuccess(userEntity: userEntity)),
    );
  }
}
