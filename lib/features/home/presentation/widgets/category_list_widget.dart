import 'package:ecommerce_apple_tech_app/core/common/widgets/product_item_widget.dart';
import 'package:flutter/material.dart';

class CategoryListWidget extends StatelessWidget {
  final double heightWidget;
  final int countItems;
  final double widthItem;
  final double heightItem;
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
      height: heightWidget,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: countItems,
        separatorBuilder: (context, index) => const SizedBox(width: 20),
        itemBuilder: (context, index) {
          return ProductItemWidget(
            width: widthItem,
            height: heightItem,
            title: titleItem,
            price: priceItem,
            rating: ratingItem,
          );
        },
      ),
    );
  }
}
