import 'package:flutter/material.dart';

import 'custom_text_form_field.dart';
import '../../../../../core/utilies/strings.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    this.onSaved,
  });
  final void Function(String?)? onSaved;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hint: AppString.password,
      icon: Icons.lock,
       obscureText: obscureText, 
      passIcon: GestureDetector(
        onTap: () {
          obscureText = !obscureText;
          setState(() {
            
          });
        },
        child: obscureText
            ? const Icon(Icons.visibility_off, color: Colors.grey)
            : const Icon(Icons.visibility, color: Colors.grey),
      ),
      onSaved: widget.onSaved,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Please enter a password.';
        }
        if (value.length < 6) {
          return 'Password must be at least 6 characters.';
        }
        return null;
      },
    );
  }
}
