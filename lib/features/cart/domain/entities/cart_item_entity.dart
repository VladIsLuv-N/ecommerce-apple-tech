class CartItemEntity {
  final String id;
  final String productId;
  final String title;
  final String imageUrl;
  final double price;
  final int quantity;
  final DateTime addedAt;

  CartItemEntity({
    required this.id,
    required this.productId,
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.quantity,
    required this.addedAt,
  });

  double get subtotal => price * quantity;

  CartItemEntity copyWith({
    String? id,
    String? productId,
    String? title,
    String? imageUrl,
    double? price,
    int? quantity,
    DateTime? addedAt,
  }) {
    return CartItemEntity(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      addedAt: addedAt ?? this.addedAt,
    );
  }
}
