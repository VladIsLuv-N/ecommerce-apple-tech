import 'package:ecommerce_apple_tech_app/core/common/entities/product_entity.dart';
import 'package:ecommerce_apple_tech_app/features/product_detail/data/datasources/product_detail_remote_datasource.dart';
import 'package:ecommerce_apple_tech_app/features/product_detail/domain/repositories/product_detail_repository.dart';

class ProductDetailRepositoryImpl implements ProductDetailRepository {
  final ProductDetailRemoteDatasource remote;

  ProductDetailRepositoryImpl({required this.remote});

  @override
  Future<ProductEntity> getProduct(String id) async {
    try {
      return await remote.getProduct(id);
    } catch (_) {
      rethrow;
    }
  }
}
