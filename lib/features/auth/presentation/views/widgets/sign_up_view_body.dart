import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weatherapp/core/utilies/strings.dart';
import 'package:weatherapp/features/auth/presentation/cubits/signup_cubit/signup_cubit_cubit.dart';
import 'package:weatherapp/features/auth/presentation/views/widgets/custom_user_name.dart';
import '../../../../../core/app_router/app_router.dart';
import '../../../../../core/utilies/custom_button.dart';
import 'password_field.dart';
import 'custom_email.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String name, email, password;
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
              AppString.signUp,
              style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width * 0.06,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: widget.screenHeight * 0.03),
            CustomUserName(onSaved: (value) {
              name = value!;
            }),
            SizedBox(height: widget.screenHeight * 0.02),
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
              label: AppString.signUp,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  context.read<SignupCubit>().createUserWithEmailAndPassword(
                        email,
                        password,
                        name,
                      );
                } else {
                  setState(() {
                    autovalidateMode = AutovalidateMode.always;
                  });
                }
              },
              backgroundColor: Colors.white,
              textColor: Colors.black,
            ),
            SizedBox(height: widget.screenHeight * 0.02),
            TextButton(
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kLoginView);
              },
              child: const Text(
                AppString.alreadyHaveAccount,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
