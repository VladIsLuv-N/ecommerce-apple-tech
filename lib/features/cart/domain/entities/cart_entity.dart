import 'package:ecommerce_apple_tech_app/features/cart/domain/entities/cart_item_entity.dart';

class CartEntity {
  final String userId;
  final List<CartItemEntity> cartItems;
  final DateTime updatedAt;

  CartEntity({
    required this.userId,
    required this.cartItems,
    required this.updatedAt,
  });

  double get totalPrice =>
      cartItems.fold(0, (sum, item) => sum + item.price * item.quantity);

  double get totalItems =>
      cartItems.fold(0, (sum, item) => sum + item.quantity);

  bool get isEmpty => cartItems.isEmpty;

  CartItemEntity? findByProductId(String id) {
    try {
      return cartItems.firstWhere((products) => id == products.productId);
    } catch (_) {
      return null;
    }
  }

  CartEntity copyWith({
    String? userId,
    List<CartItemEntity>? cartItems,
    DateTime? updatedAt,
  }) {
    return CartEntity(
      userId: userId ?? this.userId,
      cartItems: cartItems ?? this.cartItems,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
