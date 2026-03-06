class FavoritesState {
  final Set<String> favoritesId;

  FavoritesState({this.favoritesId = const {}});

  bool isFavorite(String productId) => favoritesId.contains(productId);

  FavoritesState copyWith({Set<String>? favoritesId, bool? isLoading}) {
    return FavoritesState(favoritesId: favoritesId ?? this.favoritesId);
  }
}
