import 'package:ecommerce_apple_tech_app/core/common/entities/product_entity.dart';

abstract class ProductDetailRepository {
  Future<ProductEntity> getProduct(String id);
}
