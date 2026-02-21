import 'package:ecommerce_apple_tech_app/core/common/entities/product_entity.dart';
import 'package:ecommerce_apple_tech_app/core/common/entities/category_entity.dart';

abstract class HomeRepository {
  Future<List<CategoryEntity>> getCategories();
  Future<List<ProductEntity>> getMostPopular();
  Future<List<ProductEntity>> getNewProducts();
}
