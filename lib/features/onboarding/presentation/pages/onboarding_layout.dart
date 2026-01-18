import 'package:ecommerce_apple_tech_app/features/onboarding/presentation/widgets/progress_line_widget.dart';
import 'package:flutter/material.dart';

class OnboardingLayout extends StatelessWidget {
  final Widget child;
  const OnboardingLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24).copyWith(top: 24),
          child: Column(
            children: [
              const ProgressLineWidget(progressLine: 1),
              Expanded(child: child),
            ],
          ),
        ),
      ),
    );
  }
}
