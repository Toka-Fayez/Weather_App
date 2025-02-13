import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/core/services/get_it_service.dart';
import 'package:weatherapp/features/auth/domain/repositories/auth_repo.dart';
import 'package:weatherapp/features/auth/presentation/cubits/signup_cubit/signup_cubit_cubit.dart';
import 'package:weatherapp/features/auth/presentation/views/widgets/signup_view_body_bloc_consumer.dart';


class SignUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => SignupCubit(
        getIt<AuthRepo>(),
      ),
      child: Scaffold(
        body: SiginupViewBodyBlocConsumer(screenWidth: screenWidth, screenHeight: screenHeight),
      ),
    );
  }
}


