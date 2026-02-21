import 'package:ecommerce_apple_tech_app/features/categories/domain/entities/category_with_products_entity.dart';

abstract class CategoriesState {}

class CategoriesInit extends CategoriesState {}

class CategoriesLoading extends CategoriesState {}

class CategoriesLoaded extends CategoriesState {
  final List<CategoryWithProductsEntity> categories;

  CategoriesLoaded({required this.categories});
}

class CategoriesError extends CategoriesState {
  final String message;

  CategoriesError({required this.message});
}
