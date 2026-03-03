import 'package:ecommerce_apple_tech_app/core/common/widgets/section_header_widget.dart';
import 'package:flutter/material.dart';

class MyWalletSection extends StatelessWidget {
  const MyWalletSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        SectionHeaderWidget(
          title: 'My Wallet',
          buttonTitle: 'View Wallet History',
          onPressed: () {},
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(24),
          width: double.infinity,
          decoration: BoxDecoration(
            color: theme.colorScheme.primary,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            children: [
              Text(
                'My Balance',
                style: theme.textTheme.bodyMedium!.copyWith(
                  color: theme.colorScheme.onPrimary,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                '\$ 1234.34',
                style: theme.textTheme.titleLarge!.copyWith(fontSize: 40),
              ),
              const SizedBox(height: 5),
              Text(
                'Updated : 8 May 2025, 10:00 AM',
                style: theme.textTheme.labelMedium!.copyWith(
                  color: theme.colorScheme.onPrimary.withAlpha(200),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: .center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      side: WidgetStatePropertyAll(
                        BorderSide(color: theme.colorScheme.onPrimary),
                      ),
                      padding: const WidgetStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 15),
                      ),
                      backgroundColor: const WidgetStatePropertyAll(
                        Colors.transparent,
                      ),
                      foregroundColor: WidgetStatePropertyAll(
                        theme.colorScheme.onPrimary,
                      ),
                    ),
                    child: const Row(
                      children: [
                        Text('Transfer'),
                        SizedBox(width: 10),
                        Icon(Icons.send, size: 20),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      padding: const WidgetStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 15),
                      ),
                      backgroundColor: WidgetStatePropertyAll(
                        theme.colorScheme.onPrimary,
                      ),
                      foregroundColor: WidgetStatePropertyAll(
                        theme.colorScheme.primary,
                      ),
                    ),
                    child: const Row(
                      children: [
                        Text('Top Up'),
                        SizedBox(width: 10),
                        Icon(Icons.add, size: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
