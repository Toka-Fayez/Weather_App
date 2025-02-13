
import 'package:flutter/material.dart';

import '../../../../../core/utilies/strings.dart';
import 'custom_text_form_field.dart';

class CustomEmail extends StatelessWidget {
  const CustomEmail({
    super.key,
    required this.onSaved,
  });
  final void Function(String?) onSaved;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hint: AppString.email,
      icon: Icons.email,
  
       onSaved:onSaved
       ,
      
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Please enter an email.';
        }
        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
          return 'Please enter a valid email.';
        }
        return null;
      },
    );
  }
}
