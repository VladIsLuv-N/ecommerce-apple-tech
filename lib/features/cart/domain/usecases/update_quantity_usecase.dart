import 'package:ecommerce_apple_tech_app/features/cart/domain/repositories/cart_repository.dart';

class UpdateQuantityUsecase {
  final CartRepository repository;

  UpdateQuantityUsecase({required this.repository});

  Future<void> call({
    required String userId,
    required String cartItemId,
    required int quantity,
  }) {
    if (quantity <= 0) {
      return repository.removeItem(userId, cartItemId);
    }

    return repository.updateQuantity(userId, cartItemId, quantity);
  }
}
