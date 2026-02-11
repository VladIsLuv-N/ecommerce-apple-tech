import 'package:ecommerce_apple_tech_app/core/common/entities/product_entity.dart';

abstract class ProductDetailState {}

class ProductDetailInit extends ProductDetailState {}

class ProductDetailLoading extends ProductDetailState {}

class ProductDetailLoaded extends ProductDetailState {
  final ProductEntity product;

  ProductDetailLoaded({required this.product});
}

class ProductDetailError extends ProductDetailState {
  final String message;

  ProductDetailError({required this.message});
}
