import 'dart:async';

import 'package:ecommerce_apple_tech_app/features/cart/domain/usecases/add_item_usecase.dart';
import 'package:ecommerce_apple_tech_app/features/cart/domain/usecases/update_quantity_usecase.dart';
import 'package:ecommerce_apple_tech_app/features/cart/domain/usecases/watch_cart_usecase.dart';
import 'package:ecommerce_apple_tech_app/features/cart/presentation/cubit/product_cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCartCubit extends Cubit<ProductCartState> {
  final WatchCartUsecase _watchCartUsecase;
  final AddItemUsecase _addItemUsecase;
  final UpdateQuantityUsecase _updateQuantityUsecase;

  StreamSubscription? _subscription;

  ProductCartCubit({
    required WatchCartUsecase watchCartUsecase,
    required AddItemUsecase addItemUsecase,
    required UpdateQuantityUsecase updateQuantityUsecase,
  }) : _watchCartUsecase = watchCartUsecase,
       _addItemUsecase = addItemUsecase,
       _updateQuantityUsecase = updateQuantityUsecase,
       super(ProductCartState());

  void init({
    required String userId,
    required String productId,
    required double price,
  }) {
    emit(state.copyWith(status: ProductCartStatus.loading, price: price));

    _subscription?.cancel();

    _subscription = _watchCartUsecase(userId).listen(
      (cart) {
        final item = cart.findByProductId(productId);
        emit(
          ProductCartState(
            status: ProductCartStatus.loaded,
            quantity: item?.quantity ?? 0,
            price: state.price,
            itemId: item?.id,
          ),
        );
        // emit(
        //   state.copyWith(
        //     status: ProductCartStatus.loaded,
        //     quantity: item?.quantity ?? 0,
        //     itemId: item?.id,
        //   ),
        // );
      },
      onError: (e) {
        emit(
          state.copyWith(
            status: ProductCartStatus.error,
            errorMessage: e.toString(),
          ),
        );
      },
    );
  }

  Future<void> increment({
    required String userId,
    required String productId,
    required String title,
    required String imageUrl,
  }) async {
    try {
      if (state.itemId == null) {
        await _addItemUsecase(
          userId: userId,
          title: title,
          productId: productId,
          imageUrl: imageUrl,
          price: state.price,
        );
      } else {
        await _updateQuantityUsecase(
          userId: userId,
          cartItemId: state.itemId!,
          quantity: state.quantity + 1,
        );
      }
    } catch (e) {
      state.copyWith(
        status: ProductCartStatus.error,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> decrement({required String userId}) async {
    if (state.itemId == null) return;

    try {
      await _updateQuantityUsecase(
        userId: userId,
        cartItemId: state.itemId!,
        quantity: state.quantity - 1,
      );
    } catch (e) {
      state.copyWith(
        status: ProductCartStatus.error,
        errorMessage: e.toString(),
      );
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
