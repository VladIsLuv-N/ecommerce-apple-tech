import 'package:ecommerce_apple_tech_app/features/categories/domain/entities/category_with_products_entity.dart';

abstract class CategoriesRepository {
  Future<List<CategoryWithProductsEntity>> getCategories();
}
