import 'package:ecommerce_apple_tech_app/features/cart/domain/repositories/cart_repository.dart';

class ClearCartUsecase {
  final CartRepository repository;

  ClearCartUsecase({required this.repository});

  Future<void> call(String userId) {
    return repository.clearCart(userId);
  }
}
