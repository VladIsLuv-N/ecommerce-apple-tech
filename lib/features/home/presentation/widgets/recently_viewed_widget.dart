import 'package:flutter/material.dart';

class RecentlyViewedWidget extends StatelessWidget {
  const RecentlyViewedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            color: theme.colorScheme.secondary,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ],
    );
  }
}
