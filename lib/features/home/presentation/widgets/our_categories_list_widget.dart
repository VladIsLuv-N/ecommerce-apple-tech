import 'package:flutter/material.dart';

class OurCategoriesListWidget extends StatelessWidget {
  final int itemCount;
  final String title;

  const OurCategoriesListWidget({
    super.key,
    required this.itemCount,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: 110,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                width: 86,
                height: 86,
                decoration: BoxDecoration(
                  color: theme.colorScheme.secondary,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Iphones',
                style: theme.textTheme.bodyLarge!.copyWith(fontSize: 10),
              ),
            ],
          );
        },
      ),
    );
  }
}
