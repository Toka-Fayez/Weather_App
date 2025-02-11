import 'package:flutter/material.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: screenHeight * 0.012,
        horizontal: screenWidth * 0.04,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        "Skip",
        style: TextStyle(
          color: Colors.white,
          fontSize: screenWidth * 0.04,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
