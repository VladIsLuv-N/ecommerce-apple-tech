import 'package:flutter/material.dart';

class ProgressLineWidget extends StatelessWidget {
  final int progressLine;
  const ProgressLineWidget({super.key, required this.progressLine});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return LayoutBuilder(
      builder: (context, constrains) {
        final totalWidth = constrains.maxWidth;
        final partWidth = totalWidth / 3;

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
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
              height: 8,
              width: partWidth * progressLine,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ],
        );
      },
    );
  }
}
