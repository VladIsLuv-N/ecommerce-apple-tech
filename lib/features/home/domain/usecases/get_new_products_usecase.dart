import 'package:ecommerce_apple_tech_app/core/common/entities/product_entity.dart';
import 'package:ecommerce_apple_tech_app/features/home/domain/repositories/home_repository.dart';

class GetNewProductsUsecase {
  final HomeRepository repository;

  GetNewProductsUsecase({required this.repository});

  Future<List<ProductEntity>> call() {
    return repository.getNewProducts();
  }
}
