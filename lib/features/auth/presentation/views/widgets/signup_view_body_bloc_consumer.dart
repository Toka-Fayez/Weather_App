import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../../../core/helper_function/build_error_bar.dart';
import '../../cubits/signup_cubit/signup_cubit_cubit.dart';
import 'sign_up_view_body.dart';

class SiginupViewBodyBlocConsumer extends StatelessWidget {
  const SiginupViewBodyBlocConsumer({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {}
        if (state is SignupFailure) {
          buildErrorBar(context, state.message);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignupLoading ? true : false,
          child: SignUpViewBody(
              screenWidth: screenWidth, screenHeight: screenHeight),
        );
      },
    );
  }

 
}
