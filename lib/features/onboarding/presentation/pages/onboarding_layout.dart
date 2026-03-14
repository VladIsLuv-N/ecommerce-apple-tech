import 'package:ecommerce_apple_tech_app/features/onboarding/presentation/widgets/progress_line_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingLayout extends StatelessWidget {
  final Widget child;
  const OnboardingLayout({super.key, required this.child});

  static int _stepFromUri(String uri) {
    if (uri.contains('second')) return 2;
    if (uri.contains('third')) return 3;
    return 1;
  }

  @override
  Widget build(BuildContext context) {
    final uri = GoRouterState.of(context).uri.toString();
    final currentStep = _stepFromUri(uri);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24).copyWith(top: 24),
          child: Column(
            children: [
              ProgressLineWidget(progressLine: currentStep),
              Expanded(child: child),
            ],
          ),
        ),
      ),
    );
  }
}
