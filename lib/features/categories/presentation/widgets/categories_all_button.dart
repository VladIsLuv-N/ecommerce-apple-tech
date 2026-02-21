import 'package:flutter/material.dart';

class CategoriesAllButton extends StatelessWidget {
  const CategoriesAllButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
          side: WidgetStatePropertyAll(
            BorderSide(color: theme.colorScheme.primary),
          ),
        ),
        onPressed: () {},
        child: const Row(
          mainAxisAlignment: .center,
          children: [
            Text('View All Products'),
            SizedBox(width: 10),
            Icon(Icons.arrow_forward),
          ],
        ),
      ),
    );
  }
}

class CategoriesAllButtonSkeleton extends StatelessWidget {
  const CategoriesAllButtonSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
          side: WidgetStatePropertyAll(
            BorderSide(color: theme.colorScheme.primary),
          ),
        ),
        onPressed: null,
        child: const Row(
          mainAxisAlignment: .center,
          children: [
            Text('View All Products'),
            SizedBox(width: 10),
            Icon(Icons.arrow_forward),
          ],
        ),
      ),
    );
  }
}
