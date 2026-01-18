import 'package:ecommerce_apple_tech_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final Widget prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;

  const CustomTextFieldWidget({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextFormField(
      keyboardType: keyboardType,
      obscureText: obscureText,
      style: theme.textTheme.labelMedium!.copyWith(color: AppColors.inputTextColor),
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
