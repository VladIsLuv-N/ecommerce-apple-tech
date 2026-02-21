import 'package:ecommerce_apple_tech_app/features/categories/domain/entities/category_with_products_entity.dart';
import 'package:ecommerce_apple_tech_app/features/categories/presentation/widgets/categories_all_button.dart';
import 'package:ecommerce_apple_tech_app/features/categories/presentation/widgets/categories_card_header.dart';
import 'package:ecommerce_apple_tech_app/features/categories/presentation/widgets/categories_products_list.dart';
import 'package:flutter/material.dart';

class CategoriesList extends StatelessWidget {
  final List<CategoryWithProductsEntity> categories;

  const CategoriesList({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SliverList.separated(
      itemCount: categories.length,
      separatorBuilder: (_, _) => const SizedBox(height: 24),
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1.5,
              color: theme.colorScheme.surface.withAlpha(150),
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CategoriesCardHeader(category: categories[index]),
              const SizedBox(height: 24),
              CategoriesProductsList(products: categories[index].products),
              const SizedBox(height: 24),
              const CategoriesAllButton(),
            ],
          ),
        );
      },
    );
  }
}

class CategoriesListSkeleton extends StatelessWidget {
  const CategoriesListSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SliverList.separated(
      itemCount: 3,
      separatorBuilder: (_, _) => const SizedBox(height: 24),
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1.5,
              color: theme.colorScheme.surface.withAlpha(150),
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CategoriesCardHeaderSkeleton(),
              SizedBox(height: 24),
              CategoriesProductsListSkeleton(),
              SizedBox(height: 24),
              CategoriesAllButtonSkeleton(),
            ],
          ),
        );
      },
    );
  }
}
