import 'package:ecommerce_apple_tech_app/features/cart/domain/repositories/cart_repository.dart';

class RemoveItemFromCartUsecase {
  final CartRepository repository;

  RemoveItemFromCartUsecase({required this.repository});

  Future<void> call(String userId, String itemId) {
    return repository.removeItem(userId, itemId);
  }
}
