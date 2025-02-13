import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:weatherapp/core/helper_function/build_error_bar.dart';

import '../../cubits/login_cubit/login_cubit.dart';
import 'login_view_body.dart';

class LoginViewBlocConsumer extends StatelessWidget {
  const LoginViewBlocConsumer({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {}

        if (state is LoginFailure) {
          buildErrorBar(context, state.message);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is LoginLoading ? true : false,
          child: LoginViewBody(
              screenWidth: screenWidth, screenHeight: screenHeight),
        );
      },
    );
  }
}
