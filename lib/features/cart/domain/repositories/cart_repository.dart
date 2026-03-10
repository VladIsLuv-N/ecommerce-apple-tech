import 'package:ecommerce_apple_tech_app/features/cart/domain/entities/cart_entity.dart';
import 'package:ecommerce_apple_tech_app/features/cart/domain/entities/cart_item_entity.dart';

abstract class CartRepository {
  Stream<CartEntity> watchCart(String userId);
  Future<void> addItem(String userId, CartItemEntity cartItem);
  Future<void> removeItem(String userId, String cartItemId);
  Future<void> updateQuantity(String userId, String cartItemId, int quantity);
  Future<void> clearCart(String userId);
}
