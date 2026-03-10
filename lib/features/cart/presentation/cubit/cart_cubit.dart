import 'dart:async';

import 'package:ecommerce_apple_tech_app/features/cart/domain/usecases/clear_cart_usecase.dart';
import 'package:ecommerce_apple_tech_app/features/cart/domain/usecases/remove_item_usecase.dart';
import 'package:ecommerce_apple_tech_app/features/cart/domain/usecases/update_quantity_usecase.dart';
import 'package:ecommerce_apple_tech_app/features/cart/domain/usecases/watch_cart_usecase.dart';
import 'package:ecommerce_apple_tech_app/features/cart/presentation/cubit/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  final WatchCartUsecase _watchCartUsecase;
  final UpdateQuantityUsecase _updateQuantityUsecase;
  final RemoveItemFromCartUsecase _removeItemFromCartUsecase;
  final ClearCartUsecase _clearCartUsecase;

  StreamSubscription? _subscription;

  CartCubit({
    required WatchCartUsecase watchCartUsecase,
    required UpdateQuantityUsecase updateQuantityUsecase,
    required RemoveItemFromCartUsecase removeItemFromCartUsecase,
    required ClearCartUsecase clearCartUsecase,
  }) : _watchCartUsecase = watchCartUsecase,
       _updateQuantityUsecase = updateQuantityUsecase,
       _removeItemFromCartUsecase = removeItemFromCartUsecase,
       _clearCartUsecase = clearCartUsecase,
       super(CartState());

  void watchCart(String userId) {
    emit(state.copyWith(status: CartStatus.loading));
    _subscription?.cancel();

    _subscription = _watchCartUsecase(userId).listen(
      (cart) {
        emit(state.copyWith(status: CartStatus.loaded, cart: cart));
      },
      onError: (e) => emit(
        state.copyWith(status: CartStatus.error, errorMesage: e.toString()),
      ),
    );
  }

  Future<void> removeItem({
    required String userId,
    required String itemId,
  }) async {
    try {
      await _removeItemFromCartUsecase(userId, itemId);
    } catch (e) {
      emit(state.copyWith(status: CartStatus.error, errorMesage: e.toString()));
    }
  }

  Future<void> updateQuantity({
    required String userId,
    required String itemId,
    required int quantity,
  }) async {
    try {
      await _updateQuantityUsecase(
        userId: userId,
        cartItemId: itemId,
        quantity: quantity,
      );
    } catch (e) {
      emit(state.copyWith(status: CartStatus.error, errorMesage: e.toString()));
    }
  }

  Future<void> clearCart(String userId) async {
    try {
      await _clearCartUsecase(userId);
    } catch (e) {
      emit(state.copyWith(status: CartStatus.error, errorMesage: e.toString()));
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
