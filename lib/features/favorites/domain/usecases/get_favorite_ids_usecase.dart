import 'package:ecommerce_apple_tech_app/features/favorites/domain/repository/favorites_repository.dart';

class GetFavoriteIdsUsecase {
  final FavoritesRepository repository;

  GetFavoriteIdsUsecase({required this.repository});

  Stream<Set<String>> call() => repository.getFavoriteIds();
}
