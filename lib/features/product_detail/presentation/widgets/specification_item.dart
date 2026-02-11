import 'package:flutter/material.dart';

class SpecificationItem extends StatelessWidget {
  final String title;
  final String value;

  const SpecificationItem({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: theme.colorScheme.primary.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Icon(Icons.apple, color: theme.colorScheme.primary),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: .start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${title[0].toUpperCase()}${title.substring(1)}',
                style: theme.textTheme.bodyLarge!.copyWith(fontSize: 14),
              ),
              const SizedBox(height: 5),
              Text(
                value,
                style: theme.textTheme.bodySmall!.copyWith(fontSize: 12),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
