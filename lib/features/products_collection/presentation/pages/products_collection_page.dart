import 'package:ecommerce_apple_tech_app/core/common/widgets/banner_widget.dart';
import 'package:ecommerce_apple_tech_app/core/common/widgets/product_item_widget.dart';
import 'package:ecommerce_apple_tech_app/core/common/widgets/search_widget.dart';
import 'package:ecommerce_apple_tech_app/features/products_collection/presentation/cubit/product_collection_cubit.dart';
import 'package:ecommerce_apple_tech_app/features/products_collection/presentation/cubit/product_collection_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProductsCollectionPage extends StatelessWidget {
  final String tag;

  const ProductsCollectionPage({super.key, required this.tag});

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
                      'Our ${tag[0].toUpperCase()}${tag.substring(1)} Products',
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
              const BannerWidget(color: Colors.amber),
              const SizedBox(height: 24),
              Text(
                '${tag[0].toUpperCase()}${tag.substring(1)} Products',
                style: theme.textTheme.titleMedium,
              ),
              const SizedBox(height: 16),
              Expanded(
                child:
                    BlocBuilder<ProductCollectionCubit, ProductCollectionState>(
                      builder: (context, state) {
                        if (state is ProductCollectionLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        if (state is ProductCollectionLoaded) {
                          return GridView.builder(
                            itemCount: state.products.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.60,
                                  crossAxisSpacing: 16,
                                  mainAxisSpacing: 16,
                                ),
                            itemBuilder: (context, index) {
                              return ProductItemWidget(
                                width: double.infinity,
                                height: 188,
                                product: state.products[index],
                              );
                            },
                          );
                        }

                        if (state is ProductCollectionError) {
                          return Center(child: Text(state.message));
                        }

                        return const SizedBox.shrink();
                      },
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
