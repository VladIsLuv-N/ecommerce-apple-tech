import 'package:ecommerce_apple_tech_app/features/cart/domain/entities/cart_entity.dart';
import 'package:ecommerce_apple_tech_app/features/cart/domain/repositories/cart_repository.dart';

class WatchCartUsecase {
  final CartRepository repository;

  WatchCartUsecase({required this.repository});

  Stream<CartEntity> call(String userId) {
    return repository.watchCart(userId);
  }
}
