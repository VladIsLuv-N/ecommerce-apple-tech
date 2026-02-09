import 'dart:developer';

import 'package:ecommerce_apple_tech_app/core/theme/app_colors.dart';
import 'package:ecommerce_apple_tech_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:ecommerce_apple_tech_app/features/auth/presentation/cubit/auth_state.dart';
import 'package:ecommerce_apple_tech_app/features/auth/presentation/widgets/custom_button_widget.dart';
import 'package:ecommerce_apple_tech_app/features/auth/presentation/widgets/custom_text_field_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();

  final _formKey = GlobalKey<FormState>();

  bool _obscurePassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocus.dispose();
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

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }

    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }

    return null;
  }

  void onLogin() {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState?.validate() ?? false) {
      context.read<AuthCubit>().signIn(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } else {
      log('No success!');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthAuthenticated) {
            context.goNamed('home');
          }

          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.message,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          final isLoading = state is AuthLoading;

          return Form(
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
                      'Sign in to track your orders, manage your wishlist, and shop your favorite items anytime.',
                    ),
                    const SizedBox(height: 50),
                    Text('Email', style: theme.textTheme.bodyLarge),
                    const SizedBox(height: 10),
                    CustomTextFieldWidget(
                      validator: _validateEmail,
                      controller: emailController,
                      focusNode: emailFocus,
                      hintText: 'Input your email here',
                      prefixIcon: const Icon(Icons.email_outlined, size: 20),
                    ),
                    const SizedBox(height: 24),
                    Text('Password', style: theme.textTheme.bodyLarge),
                    const SizedBox(height: 10),
                    CustomTextFieldWidget(
                      validator: _validatePassword,
                      controller: passwordController,
                      focusNode: passwordFocus,
                      obscureText: _obscurePassword,
                      hintText: '********',
                      prefixIcon: const Icon(
                        Icons.lock_outline_rounded,
                        size: 20,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          size: 20,
                        ),
                      ),
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
                    CustomButtonWidget(
                      title: isLoading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(),
                            )
                          : Text('Login', style: theme.textTheme.labelLarge),
                      isActive: true,
                      onPressed: isLoading ? null : onLogin,
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
                              recognizer: TapGestureRecognizer()
                                ..onTap = isLoading
                                    ? null
                                    : () {
                                        context.goNamed('signUp');
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
          );
        },
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
        text: 'Welcome',
        style: theme.textTheme.displayLarge,
        children: [
          TextSpan(
            text: ' Back!',
            style: theme.textTheme.displayLarge!.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
