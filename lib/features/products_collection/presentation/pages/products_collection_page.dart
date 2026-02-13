import 'package:ecommerce_apple_tech_app/core/common/widgets/banner_widget.dart';
import 'package:ecommerce_apple_tech_app/core/common/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductsCollectionPage extends StatelessWidget {
  const ProductsCollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 24,
          ).copyWith(top: 0),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.pop();
                    },
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
                  Center(
                    child: Text(
                      'Our New Products',
                      style: theme.textTheme.displayMedium,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const SearchWidget(),
              const SizedBox(height: 16),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 2,
                child: OverflowBox(
                  maxWidth: MediaQuery.of(context).size.width,
                  child: Divider(
                    height: 2,
                    color: theme.colorScheme.surface.withAlpha(75),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const BannerWidget(),
              const SizedBox(height: 24),
              Text('New Products', style: theme.textTheme.titleMedium),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
