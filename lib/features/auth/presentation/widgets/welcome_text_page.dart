import 'package:ecommerce_apple_tech_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class WelcomeTextWidget extends StatelessWidget {
  const WelcomeTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return RichText(
      text: TextSpan(
        text: 'Welcome',
        style: theme.textTheme.displayMedium,
        children: [
          TextSpan(
            text: ' Back!',
            style: theme.textTheme.displayMedium!.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
