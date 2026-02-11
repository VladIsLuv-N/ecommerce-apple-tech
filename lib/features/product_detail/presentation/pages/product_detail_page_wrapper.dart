import 'package:ecommerce_apple_tech_app/core/di/service_locator.dart';
import 'package:ecommerce_apple_tech_app/features/product_detail/presentation/cubit/product_detail_cubit.dart';
import 'package:ecommerce_apple_tech_app/features/product_detail/presentation/pages/product_detail_page.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailPageWrapper extends StatelessWidget {
  final String productId;

  const ProductDetailPageWrapper({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProductDetailCubit>()..getProduct(productId),
      child: const ProductDetailPage(),
    );
  }
}
