import 'package:ecommerce_apple_tech_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final Widget title;
  final bool isActive;
  final void Function()? onPressed;

  const CustomButtonWidget({
    super.key,
    required this.title,
    required this.isActive,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: const ButtonStyle(
          overlayColor: WidgetStatePropertyAll(AppColors.secondaryDarkColor),
          backgroundColor: WidgetStatePropertyAll(AppColors.primaryColor),
        ),
        onPressed: onPressed,
        child: title,
      ),
    );
  }
}
