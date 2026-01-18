import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingSecondPage extends StatelessWidget {
  const OnboardingSecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        const Expanded(
          child: Center(
            child: Text(
              'SecondStep',
              style: TextStyle(color: Colors.black, fontSize: 40),
            ),
          ),
        ),
        Row(
          children: [
            TextButton(onPressed: () {
              context.goNamed('signIn');
            }, child: const Text('Skip')),
            const Spacer(),
            ElevatedButton(onPressed: () {
              context.pop();
            }, child: const Text('Previous')),
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
