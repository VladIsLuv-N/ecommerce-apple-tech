import 'package:ecommerce_apple_tech_app/core/common/entities/product_entity.dart';
import 'package:ecommerce_apple_tech_app/core/common/widgets/product_item_widget.dart';
import 'package:flutter/material.dart';

class ProductsCollectionList extends StatelessWidget {
  final List<ProductEntity> products;

  const ProductsCollectionList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.60,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemBuilder: (context, index) {
        return ProductItemWidget(
          width: double.infinity,
          height: 188,
          product: products[index],
        );
      },
    );
  }
}
