import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weatherapp/core/utilies/assets.dart';
import 'package:weatherapp/core/utilies/strings.dart';
import '../../../../core/app_router/app_router.dart';
import '../../../../core/utilies/custom_button.dart';

class AuthChoiceView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.logo,
              width: screenWidth * 0.5,
            ),
            SizedBox(height: screenHeight * 0.05),
            Text(
              AppString.appWelcome,
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth * 0.06,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            CustomButton(
              label: AppString.login,
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kLoginView);
              },
              backgroundColor: Colors.white,
              textColor: Colors.black,
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.3,
                vertical: screenHeight * 0.02,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            CustomButton(
              label: AppString.signUp,
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kSignUpView);
              },
              backgroundColor: Colors.transparent,
              textColor: Colors.white,
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.26,
                vertical: screenHeight * 0.02,
              ),
              border: BorderSide(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
