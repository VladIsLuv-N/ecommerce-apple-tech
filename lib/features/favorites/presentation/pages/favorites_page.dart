import 'package:ecommerce_apple_tech_app/core/common/entities/product_entity.dart';
import 'package:ecommerce_apple_tech_app/core/common/widgets/product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        leadingWidth: 65,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            context.pop();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ).copyWith(left: 24),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Icon(
                Icons.arrow_back_rounded,
                size: 20,
                color: theme.colorScheme.onPrimary,
              ),
            ),
          ),
        ),
        title: Text('My Wishlist', style: theme.textTheme.displayMedium),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24).copyWith(top: 14, bottom: 0),
        child: GridView.builder(
          itemCount: 20,
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
              product: ProductEntity(
                id: '',
                name: 'Iphone 15 256',
                description: '',
                category: '',
                images: [
                  'https://i.ibb.co/QFG2k3WC/iphone-15-pro-max-black-1-Photoroom.png',
                ],
                specification: {},
                isAvailable: true,
                price: 999,
                rating: 4.6,
                reviewsCount: 120,
                stock: 999,
                tags: [],
                createdAt: DateTime.now(),
              ),
            );
          },
        ),
      ),
    );
  }
}
