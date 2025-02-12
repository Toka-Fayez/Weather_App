import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/app_router/app_router.dart';
import 'widgets/custom_button.dart';

class AuthChoiceView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Color.fromARGB(255, 46, 100, 158)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: screenWidth * 0.5,
            ),
            SizedBox(height: screenHeight * 0.05),
            Text(
              "Welcome to Weathora",
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth * 0.06,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            CustomButton(
              label: "Login",
              onPressed: () =>
                  GoRouter.of(context).push(AppRouter.kAuthChoiceView),
              backgroundColor: Colors.white,
              textColor: Colors.black,
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.3,
                vertical: screenHeight * 0.02,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            CustomButton(
              label: "Sign Up",
              onPressed: () =>
                  GoRouter.of(context).push(AppRouter.kAuthChoiceView),
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
