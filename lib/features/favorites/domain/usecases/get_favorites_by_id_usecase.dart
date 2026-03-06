import 'package:ecommerce_apple_tech_app/core/common/entities/product_entity.dart';
import 'package:ecommerce_apple_tech_app/features/favorites/domain/repository/favorites_repository.dart';

class GetFavoritesByIdUsecase {
  final FavoritesRepository repository;

  GetFavoritesByIdUsecase({required this.repository});

  Future<List<ProductEntity>> call(List<String> ids) =>
      repository.getFavoritesByIds(ids);
}
