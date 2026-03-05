import 'package:ecommerce_apple_tech_app/features/favorites/domain/repository/favorites_repository.dart';

class ToggleFavoriteUsecase {
  final FavoritesRepository repository;

  ToggleFavoriteUsecase({required this.repository});

  Future<void> call(String productId, bool isFavorite) async {
    if (isFavorite) {
      await repository.removeFavorite(productId);
    } else {
      await repository.addFavorite(productId);
    }
  }
}
