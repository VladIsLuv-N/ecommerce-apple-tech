import 'package:ecommerce_apple_tech_app/core/common/widgets/banner_widget.dart';
import 'package:ecommerce_apple_tech_app/core/common/widgets/search_widget.dart';
import 'package:ecommerce_apple_tech_app/features/products_collection/presentation/cubit/product_collection_cubit.dart';
import 'package:ecommerce_apple_tech_app/features/products_collection/presentation/cubit/product_collection_state.dart';
import 'package:ecommerce_apple_tech_app/features/products_collection/presentation/widgets/products_collection_app_bar.dart';
import 'package:ecommerce_apple_tech_app/features/products_collection/presentation/widgets/products_collection_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsCollectionPage extends StatelessWidget {
  final String tag;

  const ProductsCollectionPage({super.key, required this.tag});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: CustomScrollView(
            slivers: [
              ProductsCollectionAppBar(tag: tag),
              const SliverToBoxAdapter(child: SizedBox(height: 24)),
              const SliverToBoxAdapter(child: SearchWidget()),
              const SliverToBoxAdapter(child: SizedBox(height: 16)),
              SliverToBoxAdapter(
                child: Divider(
                  height: 2,
                  color: theme.colorScheme.surface.withAlpha(75),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 24)),
              const SliverToBoxAdapter(
                child: BannerWidget(color: Colors.amber),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 24)),
              SliverToBoxAdapter(
                child: Text(
                  '${tag[0].toUpperCase()}${tag.substring(1)} Products',
                  style: theme.textTheme.titleMedium,
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 16)),
              BlocBuilder<ProductCollectionCubit, ProductCollectionState>(
                builder: (context, state) {
                  if (state is ProductCollectionLoading) {
                    return const SliverToBoxAdapter(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }

                  if (state is ProductCollectionLoaded) {
                    return ProductsCollectionList(products: state.products);
                  }

                  if (state is ProductCollectionError) {
                    return SliverToBoxAdapter(
                      child: Center(child: Text(state.message)),
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
