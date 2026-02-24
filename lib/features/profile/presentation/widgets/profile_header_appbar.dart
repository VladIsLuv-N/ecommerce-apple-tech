import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileHeaderAppbar extends StatelessWidget {
  const ProfileHeaderAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        GestureDetector(
          onTap: () {
            context.pop();
          },
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: theme.colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Icon(
              Icons.arrow_back_rounded,
              color: theme.colorScheme.primary,
              size: 18,
            ),
          ),
        ),
        Expanded(
          child: Text(
            'My Account',
            style: theme.textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(width: 40),
      ],
    );
  }
}
