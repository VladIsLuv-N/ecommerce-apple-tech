import 'package:flutter/material.dart';

class ProgressLineWidget extends StatelessWidget {
  final int progressLine;
  const ProgressLineWidget({super.key, required this.progressLine});

  @override
  Widget build(BuildContext context) {
    final partWidth = MediaQuery.sizeOf(context).width / 3;
    final theme = Theme.of(context);

    return Stack(
      children: [
        Container(
          height: 8,
          width: double.infinity,
          decoration: BoxDecoration(
            color: theme.colorScheme.secondary,
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        Container(
          height: 8,
          width: partWidth * progressLine,
          decoration: BoxDecoration(
            color: theme.colorScheme.primary,
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ],
    );
  }
}
