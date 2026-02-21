import 'package:ecommerce_apple_tech_app/core/common/entities/product_entity.dart';
import 'package:ecommerce_apple_tech_app/core/common/entities/category_entity.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<CategoryEntity> categories;
  final List<ProductEntity> popularProducts;
  final List<ProductEntity> newProducts;

  HomeLoaded({
    required this.categories,
    required this.popularProducts,
    required this.newProducts,
  });
}

class HomeError extends HomeState {
  final String message;

  HomeError({required this.message});
}
