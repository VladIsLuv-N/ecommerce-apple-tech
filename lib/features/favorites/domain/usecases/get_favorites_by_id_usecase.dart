import 'package:ecommerce_apple_tech_app/core/common/entities/product_entity.dart';
import 'package:ecommerce_apple_tech_app/features/favorites/domain/repository/favorites_repository.dart';

class GetFavoritesByIdUsecase {
  final FavoritesRepository repository;

  GetFavoritesByIdUsecase({required this.repository});

  Stream<List<ProductEntity>> call() {
    return repository.getFavoriteIds().asyncMap((ids) async {
      if (ids.isEmpty) return [];

      return await repository.getFavoritesByIds(ids.toList());
    });
  }
}
