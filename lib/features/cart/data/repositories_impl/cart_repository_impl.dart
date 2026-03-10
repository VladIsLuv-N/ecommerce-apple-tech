import 'package:ecommerce_apple_tech_app/features/cart/data/datasources/cart_remote_datasource.dart';
import 'package:ecommerce_apple_tech_app/features/cart/data/models/cart_item_model.dart';
import 'package:ecommerce_apple_tech_app/features/cart/domain/entities/cart_entity.dart';
import 'package:ecommerce_apple_tech_app/features/cart/domain/entities/cart_item_entity.dart';
import 'package:ecommerce_apple_tech_app/features/cart/domain/repositories/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final CartRemoteDatasource _remote;

  CartRepositoryImpl({required CartRemoteDatasource remote}) : _remote = remote;

  @override
  Stream<CartEntity> watchCart(String userId) => _remote.watchCart(userId);

  @override
  Future<void> addItem(String userId, CartItemEntity cartItem) =>
      _remote.addItem(userId, CartItemModel.fromEntity(cartItem));

  @override
  Future<void> removeItem(String userId, String cartItemId) =>
      _remote.removeItem(userId, cartItemId);

  @override
  Future<void> updateQuantity(String userId, String cartItemId, int quantity) =>
      _remote.updateQuantity(userId, cartItemId, quantity);

  @override
  Future<void> clearCart(String userId) => _remote.clearCart(userId);
}
