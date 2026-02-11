import 'package:ecommerce_apple_tech_app/core/common/entities/product_entity.dart';
import 'package:ecommerce_apple_tech_app/features/product_detail/domain/repositories/product_detail_repository.dart';

class GetProductUsecase {
  final ProductDetailRepository repository;

  GetProductUsecase({required this.repository});

  Future<ProductEntity> call(String id) {
    return repository.getProduct(id);
  }
}
