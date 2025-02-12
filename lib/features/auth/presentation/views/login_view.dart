import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weatherapp/core/utilies/strings.dart';

import '../../../../core/app_router/app_router.dart';
import '../../../../core/presentation/custom_button.dart';
import 'widgets/custom_text_form_field.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body:  Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                AppString.login,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width *
                      0.08, 
                  color: Colors.white,
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
              SizedBox(height: screenHeight * 0.04),
              CustomButton(
                label: AppString.login,
                onPressed: () {
                  
                },
                backgroundColor: Colors.white,
                textColor: Colors.black,
              ),
              SizedBox(height: screenHeight * 0.02),
              TextButton(
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kSignUpView); // مسار صفحة Sign Up
                },
                child: Text(
                  AppString.noAccount,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
     
    );
  }

  Widget _buildTextField({
    required String hint,
    required IconData icon,
    bool isPassword = false,
  }) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.white54),
        prefixIcon: Icon(icon, color: Colors.white),
        filled: true,
        fillColor: Colors.white24,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
      style: TextStyle(color: Colors.white),
    );
  }
}
