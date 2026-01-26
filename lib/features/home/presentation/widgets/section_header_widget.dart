import 'package:flutter/material.dart';

class SectionHeaderWidget extends StatelessWidget {
  final String title;
  final void Function()? onPressed;

  const SectionHeaderWidget({super.key, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Expanded(child: Text(title, style: theme.textTheme.titleMedium)),
        TextButton(
          onPressed: onPressed,
          child: Text(
            'See All',
            style: theme.textTheme.labelSmall!.copyWith(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
