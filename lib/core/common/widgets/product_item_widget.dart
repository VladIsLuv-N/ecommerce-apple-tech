import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_apple_tech_app/core/common/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductItemWidget extends StatelessWidget {
  final double width;
  final double height;
  final ProductEntity product;

  const ProductItemWidget({
    super.key,
    required this.width,
    required this.height,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        context.pushNamed('detailProduct', pathParameters: {'id': product.id});
      },
      child: SizedBox(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height,
              decoration: BoxDecoration(
                color: theme.colorScheme.secondary,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: CachedNetworkImage(
                  imageUrl: product.images[0],
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Text(
                product.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodyLarge!.copyWith(fontSize: 14),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    '\$${product.price}',
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
                  '${product.rating}',
                  style: theme.textTheme.bodyLarge!.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProductItemWidgetSkeleton extends StatelessWidget {
  final double width;
  final double height;

  const ProductItemWidgetSkeleton({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Skeletonizer(
      child: SizedBox(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
              'Title Skeleton',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyLarge!.copyWith(fontSize: 14),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Price',
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
                  'Rating',
                  style: theme.textTheme.bodyLarge!.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
