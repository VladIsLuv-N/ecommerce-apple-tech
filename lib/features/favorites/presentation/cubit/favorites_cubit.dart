import 'dart:async';

import 'package:ecommerce_apple_tech_app/features/favorites/domain/usecases/get_favorite_ids_usecase.dart';
import 'package:ecommerce_apple_tech_app/features/favorites/domain/usecases/toggle_favorite_usecase.dart';
import 'package:ecommerce_apple_tech_app/features/favorites/presentation/cubit/favorites_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final GetFavoriteIdsUsecase _getFavoriteIdsUsecase;
  final ToggleFavoriteUsecase _toggleFavoriteUsecase;

  StreamSubscription<Set<String>>? _subscription;

  FavoritesCubit({
    required GetFavoriteIdsUsecase getFavoriteIdsUsecase,
    required ToggleFavoriteUsecase toggleFavoriteUsecase,
  }) : _getFavoriteIdsUsecase = getFavoriteIdsUsecase,
       _toggleFavoriteUsecase = toggleFavoriteUsecase,
       super(FavoritesState());

  void load() {
    _subscription = _getFavoriteIdsUsecase().listen(
      (ids) => emit(state.copyWith(favoritesId: ids)),
    );
  }

  Future<void> toggle(String productId) async {
    final isFavorite = state.isFavorite(productId);
    final updated = Set<String>.from(state.favoritesId);

    if (isFavorite) {
      updated.remove(productId);
    } else {
      updated.add(productId);
    }

    emit(state.copyWith(favoritesId: updated));

    try {
      await _toggleFavoriteUsecase(productId, isFavorite);
    } catch (_) {
      emit(state.copyWith(favoritesId: state.favoritesId));
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
