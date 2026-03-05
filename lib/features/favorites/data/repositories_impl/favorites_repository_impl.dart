import 'package:ecommerce_apple_tech_app/features/favorites/data/datasources/favorites_remote_datasource.dart';
import 'package:ecommerce_apple_tech_app/features/favorites/domain/repository/favorites_repository.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  final FavoritesRemoteDatasource remote;

  FavoritesRepositoryImpl({required this.remote});

  @override
  Stream<Set<String>> getFavoriteIds() => remote.getFavoriteIds();

  @override
  Future<void> addFavorite(String productId) => remote.addFavorite(productId);

  @override
  Future<void> removeFavorite(String productId) =>
      remote.removeFavorite(productId);
}
