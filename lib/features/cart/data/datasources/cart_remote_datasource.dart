import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_apple_tech_app/features/cart/data/models/cart_item_model.dart';
import 'package:ecommerce_apple_tech_app/features/cart/data/models/cart_model.dart';
import 'package:ecommerce_apple_tech_app/features/cart/domain/entities/cart_entity.dart';

abstract class CartRemoteDatasource {
  Stream<CartEntity> watchCart(String userId);
  Future<void> addItem(String userId, CartItemModel cartItem);
  Future<void> removeItem(String userId, String cartItemId);
  Future<void> updateQuantity(String userId, String cartItemId, int quantity);
  Future<void> clearCart(String userId);
}

class CartRemoteDatasourceImpl implements CartRemoteDatasource {
  final FirebaseFirestore _firestore;

  CartRemoteDatasourceImpl({required FirebaseFirestore firestore})
    : _firestore = firestore;

  CollectionReference _cartItems(String userId) {
    return _firestore.collection('carts').doc(userId).collection('items');
  }

  DocumentReference _cartDoc(String userId) {
    return _firestore.collection('carts').doc(userId);
  }

  @override
  Stream<CartEntity> watchCart(String userId) {
    return _cartItems(userId).orderBy('addedAt').snapshots().asyncMap((
      productsSnap,
    ) async {
      final products = productsSnap.docs
          .map((doc) => CartItemModel.fromFirestore(doc))
          .toList();

      final cartDoc = await _cartDoc(userId).get();

      if (!cartDoc.exists) {
        return CartModel.empty(userId);
      }

      return CartModel.fromFirestore(
        userId: userId,
        cartItems: products,
        doc: cartDoc,
      );
    });
  }

  @override
  Future<void> addItem(String userId, CartItemModel cartItem) async {
    final batch = _firestore.batch();

    final existing = await _cartItems(
      userId,
    ).where('productId', isEqualTo: cartItem.productId).limit(1).get();

    if (existing.docs.isNotEmpty) {
      batch.update(existing.docs.first.reference, {
        'quantity': FieldValue.increment(1),
      });
    } else {
      final newItemRef = _cartItems(userId).doc();
      batch.set(newItemRef, cartItem.toFirestore());
    }

    batch.set(_cartDoc(userId), {
      'updatedAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));

    await batch.commit();
  }

  @override
  Future<void> removeItem(String userId, String cartItemId) async {
    final batch = _firestore.batch();

    batch.delete(_cartItems(userId).doc(cartItemId));
    batch.update(_cartDoc(userId), {'upadtedAt': FieldValue.serverTimestamp()});

    await batch.commit();
  }

  @override
  Future<void> updateQuantity(
    String userId,
    String cartItemId,
    int quantity,
  ) async {
    final batch = _firestore.batch();

    batch.update(_cartItems(userId).doc(cartItemId), {'quantity': quantity});
    batch.update(_cartDoc(userId), {'upadtedAt': FieldValue.serverTimestamp()});

    await batch.commit();
  }

  @override
  Future<void> clearCart(String userId) async {
    final batchMax = 500;
    var snapshot = await _cartItems(userId).limit(batchMax).get();

    while (snapshot.docs.isNotEmpty) {
      final batch = _firestore.batch();

      for (final doc in snapshot.docs) {
        batch.delete(doc.reference);
      }

      await batch.commit();

      if (snapshot.docs.length < batchMax) break;

      snapshot = await _cartItems(userId).limit(batchMax).get();
    }
    await _cartDoc(userId).delete();
  }
}
