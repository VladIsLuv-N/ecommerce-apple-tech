import 'package:ecommerce_apple_tech_app/core/common/entities/product_entity.dart';

abstract class ProductCollectionRepository {
  Future<List<ProductEntity>> getProducts(String tag);
}
