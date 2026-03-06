import 'package:ecommerce_apple_tech_app/core/common/entities/product_entity.dart';

abstract class FavoritesRepository {
  Stream<Set<String>> getFavoriteIds();
  Future<void> addFavorite(String productId);
  Future<void> removeFavorite(String productId);
  Future<List<ProductEntity>> getFavoritesByIds(List<String> ids);
}
