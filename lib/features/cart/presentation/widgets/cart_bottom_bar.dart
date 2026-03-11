import 'package:flutter/material.dart';

class CartBottomBar extends StatelessWidget {
  final double totalPrice;

  const CartBottomBar({super.key, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isActiveButton = totalPrice > 0.0;

    return Container(
      height: 105,
      decoration: BoxDecoration(
        border: Border.all(
          color: theme.colorScheme.surface.withValues(alpha: 0.5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text('Total Charge', style: theme.textTheme.bodySmall),
                  const SizedBox(height: 4),
                  Text('\$$totalPrice', style: theme.textTheme.displayMedium),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: isActiveButton ? () {} : null,
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  isActiveButton
                      ? theme.primaryColor
                      : theme.colorScheme.surface,
                ),
                foregroundColor: WidgetStatePropertyAll(
                  theme.colorScheme.onPrimary,
                ),
              ),
              child: const Row(
                children: [
                  Text('Checkout Now'),
                  SizedBox(width: 4),
                  Icon(Icons.arrow_forward_outlined),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
