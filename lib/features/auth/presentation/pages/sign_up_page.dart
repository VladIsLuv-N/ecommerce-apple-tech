import 'package:ecommerce_apple_tech_app/core/theme/app_colors.dart';
import 'package:ecommerce_apple_tech_app/features/auth/presentation/widgets/custom_button_widget.dart';
import 'package:ecommerce_apple_tech_app/features/auth/presentation/widgets/custom_text_field_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final emailFocus = FocusNode();
  final nameFocus = FocusNode();
  final phoneFocus = FocusNode();
  final passwordFocus = FocusNode();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    emailFocus.dispose();
    nameFocus.dispose();
    phoneFocus.dispose();
    passwordFocus.dispose();

    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a email address';
    }

    final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }

    return null;
  }

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a name';
    }

    return null;
  }

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a phone';
    }

    final RegExp phoneRegex = RegExp(
      r'^\+?[0-9]{1,3}?[\s.-]?\(?[0-9]{2,3}\)?[\s.-]?[0-9]{3,4}[\s.-]?[0-9]{4}$',
    );

    if (!phoneRegex.hasMatch(value)) {
      return 'Please enter a valid phone number';
    }

    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }

    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }

    return null;
  }

  void onSignUp() {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState?.validate() ?? false) {
      print('Success!');
    } else {
      print('No Success!');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const _WelcomeTextWidget(),
                const SizedBox(height: 16),
                const Text(
                  'Join thousands of happy shoppers. It’s fast, free, and only takes a few seconds!',
                ),
                const SizedBox(height: 50),
                Text('Email', style: theme.textTheme.bodyLarge),
                const SizedBox(height: 10),
                CustomTextFieldWidget(
                  controller: emailController,
                  focusNode: emailFocus,
                  validator: _validateEmail,
                  hintText: 'Input your email here',
                  prefixIcon: const Icon(Icons.email_outlined, size: 20),
                ),
                const SizedBox(height: 24),
                Text('Full Name', style: theme.textTheme.bodyLarge),
                const SizedBox(height: 10),
                CustomTextFieldWidget(
                  controller: nameController,
                  focusNode: nameFocus,
                  validator: _validateName,
                  hintText: 'Input your name here',
                  prefixIcon: const Icon(Icons.person_2_outlined, size: 20),
                ),
                const SizedBox(height: 24),
                Text('Phone Number', style: theme.textTheme.bodyLarge),
                const SizedBox(height: 10),
                CustomTextFieldWidget(
                  controller: phoneController,
                  focusNode: phoneFocus,
                  validator: _validatePhone,
                  hintText: 'xxxx xxxx xxxx',
                  prefixIcon: const Icon(Icons.phone_outlined, size: 20),
                ),
                const SizedBox(height: 24),
                Text('Password', style: theme.textTheme.bodyLarge),
                const SizedBox(height: 10),
                CustomTextFieldWidget(
                  controller: passwordController,
                  focusNode: passwordFocus,
                  validator: _validatePassword,
                  obscureText: true,
                  hintText: '********',
                  prefixIcon: const Icon(Icons.lock_outline, size: 20),
                  suffixIcon: const Icon(
                    Icons.visibility_off_outlined,
                    size: 20,
                  ),
                ),
                const SizedBox(height: 30),
                CustomButtonWidget(
                  title: 'Sign Up',
                  isActive: true,
                  onPressed: onSignUp,
                ),
                const SizedBox(height: 16),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'You already have account?',
                      style: theme.textTheme.labelMedium!.copyWith(
                        color: AppColors.blackColor,
                      ),
                      children: [
                        TextSpan(
                          text: ' Login',
                          style: theme.textTheme.labelSmall,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              context.goNamed('signIn');
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _WelcomeTextWidget extends StatelessWidget {
  const _WelcomeTextWidget();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return RichText(
      text: TextSpan(
        text: 'Let’s',
        style: theme.textTheme.displayMedium!.copyWith(
          color: AppColors.primaryColor,
        ),
        children: [
          TextSpan(
            text: ' Join Shopping!',
            style: theme.textTheme.displayMedium,
          ),
        ],
      ),
    );
  }
}
