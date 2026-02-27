import 'package:flutter/material.dart';

class SectionHeaderWidget extends StatelessWidget {
  final String title;
  final String buttonTitle;
  final void Function()? onPressed;

  const SectionHeaderWidget({
    super.key,
    required this.title,
    this.onPressed,
    required this.buttonTitle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Expanded(child: Text(title, style: theme.textTheme.titleMedium)),
        TextButton(
          onPressed: onPressed,
          child: Text(
            buttonTitle,
            style: theme.textTheme.labelSmall!.copyWith(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
