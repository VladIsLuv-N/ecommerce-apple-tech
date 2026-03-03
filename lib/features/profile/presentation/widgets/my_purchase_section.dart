import 'package:ecommerce_apple_tech_app/core/common/widgets/section_header_widget.dart';
import 'package:flutter/material.dart';

class MyPurchaseSection extends StatelessWidget {
  const MyPurchaseSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SectionHeaderWidget(title: 'My Purchase', buttonTitle: 'See all'),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: .center,
          children: [
            _PurchaseItem(title: 'Wallet', icon: Icons.payments_outlined),
            SizedBox(width: 24),
            _PurchaseItem(title: 'Packaging', icon: Icons.archive_outlined),
            SizedBox(width: 24),
            _PurchaseItem(
              title: 'Delivery',
              icon: Icons.delivery_dining_outlined,
            ),
            SizedBox(width: 24),
            _PurchaseItem(title: 'Ratings', icon: Icons.star_outline),
          ],
        ),
      ],
    );
  }
}

class _PurchaseItem extends StatelessWidget {
  final String title;
  final IconData icon;

  const _PurchaseItem({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Icon(icon, size: 30, color: theme.colorScheme.secondaryContainer),
        const SizedBox(height: 10),
        Text(title, style: theme.textTheme.labelMedium),
      ],
    );
  }
}
