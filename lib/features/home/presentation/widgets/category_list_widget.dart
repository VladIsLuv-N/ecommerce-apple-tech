import 'package:ecommerce_apple_tech_app/core/common/widgets/product_item_widget.dart';
import 'package:flutter/material.dart';

class CategoryListWidget extends StatelessWidget {
  final int heightWidget;
  final int countItems;
  final int widthItem;
  final int heightItem;
  final String titleItem;
  final int priceItem;
  final double ratingItem;

  const CategoryListWidget({
    super.key,
    required this.heightWidget,
    required this.countItems,
    required this.widthItem,
    required this.heightItem,
    required this.titleItem,
    required this.priceItem,
    required this.ratingItem,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 285,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        separatorBuilder: (context, index) => const SizedBox(width: 20),
        itemBuilder: (context, index) {
          return const ProductItemWidget(
            width: 160,
            height: 160,
            title: 'iPhone 16 Pro Max – 256GB',
            price: 990,
            rating: 4.8,
          );
        },
      ),
    );
  }
}
