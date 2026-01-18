import 'package:ecommerce_apple_tech_app/core/theme/app_colors.dart';
import 'package:ecommerce_apple_tech_app/features/auth/presentation/widgets/custom_text_field_widget.dart';
import 'package:ecommerce_apple_tech_app/features/auth/presentation/widgets/welcome_text_page.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const WelcomeTextWidget(),
              const SizedBox(height: 16),
              const Text(
                'Sign in to track your orders, manage your wishlist, and shop your favorite items anytime.',
              ),
              const SizedBox(height: 50),
              Text('Email', style: theme.textTheme.bodyLarge),
              const SizedBox(height: 10),
              const CustomTextFieldWidget(
                hintText: 'Input your email here',
                prefixIcon: Icon(Icons.email_outlined, size: 20),
              ),
              const SizedBox(height: 24),
              Text('Password', style: theme.textTheme.bodyLarge),
              const SizedBox(height: 10),
              const CustomTextFieldWidget(
                obscureText: true,
                hintText: 'Input your password here',
                prefixIcon: Icon(Icons.lock_outline_rounded, size: 20),
                suffixIcon: Icon(Icons.visibility_off_outlined, size: 20),
              ),
              Row(
                children: [
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password',
                      style: theme.textTheme.labelSmall,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      AppColors.primaryColor,
                    ),
                  ),
                  onPressed: () {},
                  child: Text('Login', style: theme.textTheme.labelLarge),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Don’t have account yet?',
                    style: theme.textTheme.labelMedium!.copyWith(
                      color: AppColors.blackColor,
                    ),
                    children: [
                      TextSpan(
                        text: ' Sign Up',
                        style: theme.textTheme.labelSmall,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
