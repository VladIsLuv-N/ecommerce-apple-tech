import 'dart:async';

import 'package:ecommerce_apple_tech_app/features/cart/domain/usecases/watch_cart_usecase.dart';
import 'package:ecommerce_apple_tech_app/features/cart/presentation/cubit/cart_badge_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBadgeCubit extends Cubit<CartBadgeState> {
  final WatchCartUsecase watchCartUsecase;

  CartBadgeCubit({required this.watchCartUsecase}) : super(CartBadgeState());

  StreamSubscription? _subscription;

  void watch(String userId) {
    _subscription?.cancel();

    _subscription = watchCartUsecase(userId).listen(
      (cart) => emit(CartBadgeState(totalItems: cart.cartItems.length)),
      onError: (_) => emit(CartBadgeState(totalItems: 0)),
    );
  }

  void clear() {
    _subscription?.cancel();
    emit(CartBadgeState());
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
