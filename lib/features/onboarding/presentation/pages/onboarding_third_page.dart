import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingThirdPage extends StatelessWidget {
  const OnboardingThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        const Expanded(
          child: Center(
            child: Text(
              'ThirdStep',
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
                context.goNamed('signIn');
              },
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(theme.primaryColor),
                foregroundColor: WidgetStatePropertyAll(
                  theme.colorScheme.onPrimary,
                ),
              ),
              child: const Text('Start Shop'),
            ),
          ],
        ),
      ],
    );
  }
}
