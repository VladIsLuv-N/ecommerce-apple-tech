import 'package:flutter/material.dart';

class ProductItemWidget extends StatelessWidget {
  final double width;
  final double height;
  final String title;
  final int price;
  final double rating;

  const ProductItemWidget({
    super.key,
    required this.width,
    required this.height,
    required this.title,
    required this.price,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      width: width,
      child: Column(
        children: [
          Container(
            height: height,
            decoration: BoxDecoration(
              color: theme.colorScheme.secondary,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodyLarge!.copyWith(fontSize: 14),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Text(
                  '\$$price',
                  style: theme.textTheme.bodyLarge!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const Icon(
                Icons.star_rounded,
                color: Color(0xFFFFB13B),
                size: 16,
              ),
              const SizedBox(width: 5),
              Text(
                '$rating',
                style: theme.textTheme.bodyLarge!.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
