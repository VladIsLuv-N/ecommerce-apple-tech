import 'package:ecommerce_apple_tech_app/features/profile/presentation/widgets/profile_header_appbar.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const ProfileHeaderAppbar(),
            const SizedBox(height: 32),
            Row(
              children: [
                const CircleAvatar(radius: 32),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      Text('Hi, Vladilsav', style: theme.textTheme.labelLarge),
                      const SizedBox(height: 4),
                      Text(
                        'Ready to shop again?',
                        style: theme.textTheme.displaySmall!.copyWith(
                          color: theme.colorScheme.onPrimary,
                          fontWeight: .w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Container(
                  height: 44,
                  width: 44,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.border_color_outlined,
                      size: 20,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
