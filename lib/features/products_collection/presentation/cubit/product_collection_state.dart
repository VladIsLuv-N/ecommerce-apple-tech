import 'package:ecommerce_apple_tech_app/core/common/entities/product_entity.dart';

abstract class ProductCollectionState {}

class ProductCollectionInit extends ProductCollectionState {}

class ProductCollectionLoading extends ProductCollectionState {}

class ProductCollectionLoaded extends ProductCollectionState {
  final List<ProductEntity> products;

  ProductCollectionLoaded({required this.products});
}

class ProductCollectionError extends ProductCollectionState {
  final String message;

  ProductCollectionError({required this.message});
}
