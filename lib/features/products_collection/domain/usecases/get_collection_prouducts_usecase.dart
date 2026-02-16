import 'package:ecommerce_apple_tech_app/core/common/entities/product_entity.dart';
import 'package:ecommerce_apple_tech_app/features/products_collection/domain/repositories/product_collection_repository.dart';

class GetCollectionProuductsUsecase {
  final ProductCollectionRepository repository;

  GetCollectionProuductsUsecase({required this.repository});

  Future<List<ProductEntity>> call(String tag) {
    return repository.getProducts(tag);
  }
}
