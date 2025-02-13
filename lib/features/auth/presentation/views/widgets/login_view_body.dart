import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weatherapp/core/utilies/strings.dart';
import 'package:weatherapp/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:weatherapp/features/auth/presentation/views/widgets/custom_email.dart';
import 'package:weatherapp/features/auth/presentation/views/widgets/password_field.dart';
import '../../../../../core/app_router/app_router.dart';
import '../../../../../core/presentation/custom_button.dart';
import 'custom_text_form_field.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String email, password;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.screenWidth * 0.08),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              AppString.login,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.08,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: widget.screenHeight * 0.03),
            CustomEmail(
              onSaved: (value) {
                email = value!;
              },
             
            ),
            SizedBox(height: widget.screenHeight * 0.02),
            PasswordField(
              onSaved: (value) {
                password = value!;
              },
            ),
            SizedBox(height: widget.screenHeight * 0.04),
            CustomButton(
              label: AppString.login,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();

                  context.read<LoginCubit>().login(email, password);
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
              backgroundColor: Colors.white,
              textColor: Colors.black,
            ),
            SizedBox(height: widget.screenHeight * 0.02),
            TextButton(
              onPressed: () {
                GoRouter.of(context)
                    .push(AppRouter.kSignUpView); // مسار صفحة Sign Up
              },
              child: const Text(
                AppString.noAccount,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
