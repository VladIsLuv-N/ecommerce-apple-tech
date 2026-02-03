import 'package:ecommerce_apple_tech_app/core/common/entities/product_entity.dart';
import 'package:ecommerce_apple_tech_app/features/home/domain/repositories/home_repository.dart';

class GetMostPopularUsecase {
  final HomeRepository repository;

  GetMostPopularUsecase({required this.repository});

  Future<List<ProductEntity>> call() {
    return repository.getMostPopular();
  }
}
