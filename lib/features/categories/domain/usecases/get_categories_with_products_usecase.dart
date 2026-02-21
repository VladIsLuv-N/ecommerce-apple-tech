import 'package:ecommerce_apple_tech_app/features/categories/domain/entities/category_with_products_entity.dart';
import 'package:ecommerce_apple_tech_app/features/categories/domain/repository/categories_repository.dart';

class GetCategoriesWithProductsUsecase {
  final CategoriesRepository repository;

  GetCategoriesWithProductsUsecase({required this.repository});

  Future<List<CategoryWithProductsEntity>> call() {
    return repository.getCategories();
  }
}
