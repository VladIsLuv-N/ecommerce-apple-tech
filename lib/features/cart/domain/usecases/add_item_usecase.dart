import 'package:ecommerce_apple_tech_app/features/cart/data/models/cart_item_model.dart';
import 'package:ecommerce_apple_tech_app/features/cart/domain/repositories/cart_repository.dart';

class AddItemUsecase {
  final CartRepository repository;

  AddItemUsecase({required this.repository});

  Future<void> call({
    required String userId,
    required String productId,
    required String title,
    required String imageUrl,
    required double price,
  }) {
    final item = CartItemModel.fromProduct(
      productId: productId,
      title: title,
      imageUrl: imageUrl,
      price: price,
    );

    return repository.addItem(userId, item);
  }
}
