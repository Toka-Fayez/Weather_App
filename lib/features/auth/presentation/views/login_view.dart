import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/core/services/get_it_service.dart';
import 'package:weatherapp/features/auth/domain/repositories/auth_repo.dart';
import 'package:weatherapp/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'widgets/login_view_bloc_consumer.dart';


class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => LoginCubit(getIt.get<AuthRepo>()),
      child: Scaffold(
        body: LoginViewBlocConsumer(screenWidth: screenWidth, screenHeight: screenHeight),
      ),
    );
  }
}
