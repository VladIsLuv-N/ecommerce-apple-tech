import 'package:ecommerce_apple_tech_app/core/common/entities/category_entity.dart';
import 'package:ecommerce_apple_tech_app/core/common/entities/product_entity.dart';

class CategoryWithProductsEntity {
  final CategoryEntity category;
  final List<ProductEntity> products;

  CategoryWithProductsEntity({required this.category, required this.products});
}
