import 'package:ecommerce_apple_tech_app/core/di/service_locator.dart';
import 'package:ecommerce_apple_tech_app/features/products_collection/presentation/cubit/product_collection_cubit.dart';
import 'package:ecommerce_apple_tech_app/features/products_collection/presentation/pages/products_collection_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCollectionPageWrapper extends StatelessWidget {
  final String tag;

  const ProductCollectionPageWrapper({super.key, required this.tag});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProductCollectionCubit>()..getProducts(tag),
      child: ProductsCollectionPage(tag: tag),
    );
  }
}
