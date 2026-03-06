import 'package:ecommerce_apple_tech_app/core/common/entities/product_entity.dart';

abstract class FavoritesScreenState {}

class FavoritesScreenInit extends FavoritesScreenState {}

class FavoritesScreenLoading extends FavoritesScreenState {}

class FavoritesScreenLoaded extends FavoritesScreenState {
  final List<ProductEntity> favorites;

  FavoritesScreenLoaded({required this.favorites});
}

class FavoritesScreenEmpty extends FavoritesScreenState {}

class FavoritesScreenError extends FavoritesScreenState {
  final String message;

  FavoritesScreenError({required this.message});
}
