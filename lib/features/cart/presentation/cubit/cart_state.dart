// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_apple_tech_app/features/cart/domain/entities/cart_entity.dart';

enum CartStatus { loading, initial, loaded, error }

class CartState {
  final CartStatus status;
  final CartEntity? cart;
  final String? errorMesage;

  CartState({this.status = CartStatus.initial, this.cart, this.errorMesage});

  CartState copyWith({
    CartStatus? status,
    CartEntity? cart,
    String? errorMesage,
  }) {
    return CartState(
      status: status ?? this.status,
      cart: cart ?? this.cart,
      errorMesage: errorMesage ?? this.errorMesage,
    );
  }
}
