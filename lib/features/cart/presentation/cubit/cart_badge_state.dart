class CartBadgeState {
  final int totalItems;

  CartBadgeState({this.totalItems = 0});

  bool get hasItems => totalItems > 0;
}
