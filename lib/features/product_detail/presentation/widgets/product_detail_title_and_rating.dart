import 'package:flutter/material.dart';

class ProductDetailTitleAndRating extends StatelessWidget {
  final String title;
  final double rating;
  final int reviewCount;

  const ProductDetailTitleAndRating({
    super.key,
    required this.title,
    required this.rating,
    required this.reviewCount,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
            child: Text(
              title,
              style: theme.textTheme.bodyLarge!.copyWith(fontSize: 20),
            ),
          ),
          Row(
            children: [
              const Icon(
                Icons.star_rounded,
                color: Color(0xFFFFB13B),
                size: 16,
              ),
              const SizedBox(width: 5),
              Text(
                '$rating($reviewCount Review)',
                style: theme.textTheme.bodyMedium!.copyWith(fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
