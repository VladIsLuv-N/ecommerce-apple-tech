import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_apple_tech_app/features/home/domain/entities/category_entity.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final CategoryEntity category;

  const CategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Container(
          width: 86,
          height: 86,
          decoration: BoxDecoration(
            color: theme.colorScheme.secondary,
            borderRadius: BorderRadius.circular(16),
          ),
          child: CachedNetworkImage(
            imageUrl: category.images,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          category.name,
          style: theme.textTheme.bodyLarge!.copyWith(fontSize: 10),
        ),
      ],
    );
  }
}
