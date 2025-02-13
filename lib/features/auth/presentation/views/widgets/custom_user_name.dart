
import 'package:flutter/material.dart';

import '../../../../../core/utilies/strings.dart';
import 'custom_text_form_field.dart';

class CustomUserName extends StatelessWidget {
  const CustomUserName({
    super.key, required this.onSaved,
  });
 final void Function(String?) onSaved;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hint: AppString.userName,
      icon: Icons.person,
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Please enter a username.';
        }
        if (value.length < 3) {
          return 'Username must be at least 3 characters.';
        }
        return null;
      },
    );
  }
}
