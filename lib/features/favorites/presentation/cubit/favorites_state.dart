class FavoritesState {
  final Set<String> favoritesId;
  final bool isLoading;

  FavoritesState({this.favoritesId = const {}, this.isLoading = false});

  bool isFavorite(String productId) => favoritesId.contains(productId);

  FavoritesState copyWith({Set<String>? favoritesId, bool? isLoading}) {
    return FavoritesState(
      favoritesId: favoritesId ?? this.favoritesId,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
