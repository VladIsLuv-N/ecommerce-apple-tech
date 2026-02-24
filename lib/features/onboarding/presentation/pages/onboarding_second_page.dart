import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class OnboardingSecondPage extends StatelessWidget {
  const OnboardingSecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Expanded(
          child: Center(
            child: SvgPicture.asset('assets/images/onboarding2.svg'),
          ),
        ),
        Row(
          children: [
            TextButton(
              onPressed: () {
                context.goNamed('signIn');
              },
              child: const Text('Skip'),
            ),
            const Spacer(),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  theme.colorScheme.primaryContainer,
                ),
              ),
              onPressed: () {
                context.pop();
              },
              child: const Text('Previous'),
            ),
            const SizedBox(width: 16),
            ElevatedButton(
              onPressed: () {
                context.pushNamed('onboardingThird');
              },
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(theme.primaryColor),
                foregroundColor: WidgetStatePropertyAll(
                  theme.colorScheme.onPrimary,
                ),
              ),
              child: const Text('Next'),
            ),
          ],
        ),
      ],
    );
  }
}
