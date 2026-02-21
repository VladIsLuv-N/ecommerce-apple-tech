import 'package:ecommerce_apple_tech_app/core/common/entities/category_entity.dart';
import 'package:ecommerce_apple_tech_app/features/home/domain/repositories/home_repository.dart';

class GetCategoriesUsecase {
  final HomeRepository repository;

  GetCategoriesUsecase({required this.repository});

  Future<List<CategoryEntity>> call() async {
    return repository.getCategories();
  }
}
