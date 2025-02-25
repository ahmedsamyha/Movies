
import 'package:flutter/material.dart';
import 'package:movies/core/utility/theme_data/custom_theme/text_theme.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {super.key,
       this.prefixIcon,
       this.hint,
      required this.controller,
      required this.validator,
       this.onChanged,
      required this.keyboardType,
      this.suffixIcon,
         this.label, required this.obscureText});
   IconData? prefixIcon;
  IconData? suffixIcon;
  String? label;
   String? hint;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final bool obscureText ;
  @override
  Widget build(BuildContext context) {

    return TextFormField(

      style: KStyles.roboto16w400White,
      decoration: InputDecoration(
        fillColor: Color(0xFF282A28),
        filled: true,
        border: OutlineInputBorder(
        ),
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        suffixIcon: Icon(suffixIcon),
        labelText: label,
        hintText: hint,
        alignLabelWithHint: true,
        contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal:16),

      ),
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      keyboardType: keyboardType,
      obscureText: obscureText,
    );
  }
}
