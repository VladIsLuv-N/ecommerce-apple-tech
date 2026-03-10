import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_apple_tech_app/features/cart/domain/entities/cart_item_entity.dart';

class CartItemModel extends CartItemEntity {
  CartItemModel({
    required super.id,
    required super.productId,
    required super.title,
    required super.imageUrl,
    required super.price,
    required super.quantity,
    required super.addedAt,
  });

  factory CartItemModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return CartItemModel(
      id: doc.id,
      productId: data['productId'] as String,
      title: data['title'] as String,
      imageUrl: data['imageUrl'] as String,
      price: data['price'] as double,
      quantity: data['quantity'] as int,
      addedAt: (data['addedAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'productId': productId,
      'title': title,
      'imageUrl': imageUrl,
      'price': price,
      'quantity': quantity,
      'addedAt': Timestamp.fromDate(addedAt),
    };
  }

  factory CartItemModel.fromProduct({
    required String productId,
    required String title,
    required String imageUrl,
    required double price,
  }) {
    return CartItemModel(
      id: '',
      productId: productId,
      title: title,
      imageUrl: imageUrl,
      price: price,
      quantity: 1,
      addedAt: DateTime.now(),
    );
  }

  factory CartItemModel.fromEntity(CartItemEntity entity) {
    return CartItemModel(
      id: entity.id,
      productId: entity.productId,
      title: entity.title,
      imageUrl: entity.imageUrl,
      price: entity.price,
      quantity: entity.quantity,
      addedAt: entity.addedAt,
    );
  }
}
