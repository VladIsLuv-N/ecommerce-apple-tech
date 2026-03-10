import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_apple_tech_app/features/cart/data/models/cart_item_model.dart';
import 'package:ecommerce_apple_tech_app/features/cart/domain/entities/cart_entity.dart';
import 'package:ecommerce_apple_tech_app/features/cart/domain/entities/cart_item_entity.dart';

class CartModel extends CartEntity {
  CartModel({
    required super.userId,
    required super.cartItems,
    required super.updatedAt,
  });

  factory CartModel.fromFirestore({
    required String userId,
    required List<CartItemEntity> cartItems,
    required DocumentSnapshot doc,
  }) {
    final data = doc.data() as Map<String, dynamic>?;

    return CartModel(
      userId: userId,
      cartItems: cartItems,
      updatedAt: data?['updateAt'] != null
          ? (data!['updateAt'] as Timestamp).toDate()
          : DateTime.now(),
    );
  }

  factory CartModel.empty(String userId) {
    return CartModel(userId: userId, cartItems: [], updatedAt: DateTime.now());
  }

  Map<String, dynamic> toFirestore() {
    return {'updatedAt': Timestamp.fromDate(updatedAt)};
  }

  factory CartModel.fromEntity(CartEntity entity) {
    return CartModel(
      userId: entity.userId,
      cartItems: entity.cartItems
          .map((e) => CartItemModel.fromEntity(e))
          .toList(),
      updatedAt: entity.updatedAt,
    );
  }
}
