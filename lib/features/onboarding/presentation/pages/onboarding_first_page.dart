import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingFirstPage extends StatelessWidget {
  const OnboardingFirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        const Expanded(
          child: Center(
            child: Text(
              'FirstStep',
              style: TextStyle(color: Colors.black, fontSize: 40),
            ),
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
              onPressed: () {
                context.pushNamed('onboardingSecond');
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
