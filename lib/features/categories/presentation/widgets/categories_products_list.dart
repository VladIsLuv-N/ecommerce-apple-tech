import 'package:ecommerce_apple_tech_app/core/common/entities/product_entity.dart';
import 'package:ecommerce_apple_tech_app/core/common/widgets/product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoriesProductsList extends StatelessWidget {
  final List<ProductEntity> products;

  const CategoriesProductsList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        separatorBuilder: (context, index) => const SizedBox(width: 20),
        itemBuilder: (context, index) {
          return ProductItemWidget(
            width: 160,
            height: 160,
            product: products[index],
          );
        },
      ),
    );
  }
}

class CategoriesProductsListSkeleton extends StatelessWidget {
  const CategoriesProductsListSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: SizedBox(
        height: 250,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 6,
          separatorBuilder: (context, index) => const SizedBox(width: 20),
          itemBuilder: (context, index) {
            return const ProductItemWidgetSkeleton(width: 160, height: 160);
          },
        ),
      ),
    );
  }
}
