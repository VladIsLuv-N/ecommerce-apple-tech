abstract class FavoritesRepository {
  Stream<Set<String>> getFavoriteIds();
  Future<void> addFavorite(String productId);
  Future<void> removeFavorite(String productId);
}
