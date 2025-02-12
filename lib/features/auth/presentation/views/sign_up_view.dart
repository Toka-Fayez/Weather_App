import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weatherapp/core/utilies/strings.dart';

import '../../../../core/app_router/app_router.dart';
import '../../../../core/presentation/custom_button.dart';
import 'widgets/custom_text_form_field.dart';

class SignUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
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
            SizedBox(height: screenHeight * 0.03),
            const CustomTextFormField(
              hint: AppString.userName,
              icon: Icons.person,
            ),
            SizedBox(height: screenHeight * 0.02),
            const CustomTextFormField(
              hint: AppString.password,
              icon: Icons.lock,
              isPassword: true,
            ),
            SizedBox(height: screenHeight * 0.02),
            const CustomTextFormField(
              hint: 'Confirm Password',
              icon: Icons.lock,
              isPassword: true,
            ),
            SizedBox(height: screenHeight * 0.04),
            CustomButton(
              label: AppString.signUp,
              onPressed: () {},
              backgroundColor: Colors.white,
              textColor: Colors.black,
            ),
            SizedBox(height: screenHeight * 0.02),
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
