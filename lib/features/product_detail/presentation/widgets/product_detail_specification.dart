import 'package:ecommerce_apple_tech_app/features/product_detail/presentation/widgets/specification_item.dart';
import 'package:flutter/material.dart';

class ProductDetailSpecification extends StatelessWidget {
  final Map<String, dynamic> specification;

  const ProductDetailSpecification({super.key, required this.specification});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: .center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text('Specification', style: theme.textTheme.bodyLarge),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: specification.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemBuilder: (context, index) {
              return SpecificationItem(
                title: specification.keys.elementAt(index),
                value: specification.values.elementAt(index).toString(),
              );
            },
          ),
        ),
      ],
    );
  }
}
