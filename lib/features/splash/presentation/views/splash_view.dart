import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weatherapp/features/splash/presentation/views/widgets/skip_button.dart';

import '../../../../core/app_router/app_router.dart';
import '../../../../core/utilies/assets.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  bool showSkipButton = false;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      setState(() {
        showSkipButton = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              AppAssets.logo,
              width: screenWidth * 0.9,
            ),
          ),
          if (showSkipButton)
            Positioned(
              bottom: screenHeight * 0.04,
              right: screenWidth * 0.05,
              child: GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kAuthChoiceView);
                },
                child: SkipButton(
                    screenHeight: screenHeight, screenWidth: screenWidth),
              ),
            ),
        ],
      ),
    );
  }
}
