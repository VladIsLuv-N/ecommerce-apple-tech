import 'package:ecommerce_apple_tech_app/features/categories/domain/entities/category_with_products_entity.dart';
import 'package:ecommerce_apple_tech_app/features/categories/presentation/widgets/category_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoriesCardHeader extends StatelessWidget {
  final CategoryWithProductsEntity category;

  const CategoriesCardHeader({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        CategoryImage(imageUrl: category.category.images),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                category.category.name,
                style: theme.textTheme.bodyLarge,
                maxLines: 1,
              ),
              Text(
                '${category.products.length}',
                style: theme.textTheme.bodySmall,
                maxLines: 1,
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.star_rounded,
                  color: Color(0xFFFFB13B),
                  size: 16,
                ),
                const SizedBox(width: 5),
                Text(
                  '4.7',
                  style: theme.textTheme.bodyLarge!.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Text(
              '(12220+)',
              style: theme.textTheme.bodySmall!.copyWith(fontSize: 12),
              maxLines: 1,
            ),
          ],
        ),
      ],
    );
  }
}

class CategoriesCardHeaderSkeleton extends StatelessWidget {
  const CategoriesCardHeaderSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Skeletonizer(
      child: Row(
        children: [
          const CategoryImageSkeleton(),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Category Name',
                  style: theme.textTheme.bodyLarge,
                  maxLines: 1,
                ),
                Text('Count', style: theme.textTheme.bodySmall, maxLines: 1),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.star_rounded,
                    color: Color(0xFFFFB13B),
                    size: 16,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    '4.7',
                    style: theme.textTheme.bodyLarge!.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Text(
                '(12220+)',
                style: theme.textTheme.bodySmall!.copyWith(fontSize: 12),
                maxLines: 1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
