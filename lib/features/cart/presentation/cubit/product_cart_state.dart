// ignore_for_file: public_member_api_docs, sort_constructors_first
enum ProductCartStatus { initial, loading, loaded, error }

class ProductCartState {
  final ProductCartStatus status;
  final int quantity;
  final double price;
  final String? itemId;
  final String? errorMessage;

  ProductCartState({
    this.status = ProductCartStatus.initial,
    this.quantity = 0,
    this.price = 0,
    this.itemId,
    this.errorMessage,
  });

  double get totalPrice => quantity * price;
  bool get inCart => quantity > 0;

  ProductCartState copyWith({
    ProductCartStatus? status,
    int? quantity,
    double? price,
    String? itemId,
    String? errorMessage,
  }) {
    return ProductCartState(
      status: status ?? this.status,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      itemId: itemId ?? this.itemId,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
