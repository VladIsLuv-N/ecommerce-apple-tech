import 'dart:async';

import 'package:ecommerce_apple_tech_app/features/favorites/domain/usecases/get_favorites_by_id_usecase.dart';
import 'package:ecommerce_apple_tech_app/features/favorites/presentation/cubit/favorites_screen_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesScreenCubit extends Cubit<FavoritesScreenState> {
  final GetFavoritesByIdUsecase _getFavoritesByIdUsecase;

  FavoritesScreenCubit({
    required GetFavoritesByIdUsecase getFavoritesByIdUsecase,
  }) : _getFavoritesByIdUsecase = getFavoritesByIdUsecase,
       super(FavoritesScreenInit());

  StreamSubscription? _subscription;

  void load() {
    emit(FavoritesScreenLoading());

    _subscription = _getFavoritesByIdUsecase().listen((products) {
      if (products.isEmpty) {
        emit(FavoritesScreenEmpty());
      } else {
        emit(FavoritesScreenLoaded(favorites: products));
      }
    }, onError: (e) => emit(FavoritesScreenError(message: e.toString())));
  }

  // Future<void> _handleFavoritesState(FavoritesState favoritesState) async {
  //   try {
  //     final ids = favoritesState.favoritesId;

  //     if (ids.isEmpty) {
  //       emit(FavoritesScreenEmpty());
  //       return;
  //     }

  //     final favorites = await _getFavoritesByIdUsecase(ids.toList());

  //     emit(FavoritesScreenLoaded(favorites: favorites));
  //   } catch (e) {
  //     emit(FavoritesScreenError(message: e.toString()));
  //   }
  // }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
