import 'package:ecommerce_apple_tech_app/features/product_detail/presentation/cubit/product_detail_cubit.dart';
import 'package:ecommerce_apple_tech_app/features/product_detail/presentation/cubit/product_detail_state.dart';
import 'package:ecommerce_apple_tech_app/features/product_detail/presentation/widgets/product_detail_description.dart';
import 'package:ecommerce_apple_tech_app/features/product_detail/presentation/widgets/product_detail_header.dart';
import 'package:ecommerce_apple_tech_app/features/product_detail/presentation/widgets/product_detail_specification.dart';
import 'package:ecommerce_apple_tech_app/features/product_detail/presentation/widgets/product_detail_title_and_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const ProductDetailBottomBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocBuilder<ProductDetailCubit, ProductDetailState>(
            builder: (context, state) {
              if (state is ProductDetailLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is ProductDetailLoaded) {
                final product = state.product;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductDetailHeader(images: product.images),
                    const SizedBox(height: 18),
                    ProductDetailTitleAndRating(
                      title: product.name,
                      rating: product.rating,
                      reviewCount: product.reviewsCount,
                    ),
                    const SizedBox(height: 24),
                    const ProductDetailDescription(),
                    const SizedBox(height: 24),
                    ProductDetailSpecification(
                      specification: product.specification,
                    ),
                  ],
                );
              }

              if (state is ProductDetailError) {
                return Center(
                  child: Text(
                    state.message,
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              }

              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}

class ProductDetailBottomBar extends StatelessWidget {
  const ProductDetailBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 105,
      decoration: BoxDecoration(
        border: BoxBorder.all(
          color: theme.colorScheme.surface.withValues(alpha: 0.5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text('Total Price', style: theme.textTheme.bodySmall),
                  const SizedBox(height: 4),
                  Text('\$0.00', style: theme.textTheme.displayMedium),
                ],
              ),
            ),
            Container(
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: theme.colorScheme.primaryContainer,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Container(
                      height: 42,
                      width: 42,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(
                        Icons.remove_rounded,
                        color: theme.colorScheme.onPrimary,
                      ),
                    ),
                    Text('0', style: theme.textTheme.displaySmall),
                    Container(
                      height: 42,
                      width: 42,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(
                        Icons.add_rounded,
                        color: theme.colorScheme.onPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 16),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: theme.colorScheme.primary),
              ),
              child: Icon(
                Icons.shopping_cart_outlined,
                color: theme.colorScheme.primary,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
