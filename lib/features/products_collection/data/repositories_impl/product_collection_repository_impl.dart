import 'package:ecommerce_apple_tech_app/core/common/entities/product_entity.dart';
import 'package:ecommerce_apple_tech_app/features/products_collection/data/datasources/product_collection_remote_datasource.dart';
import 'package:ecommerce_apple_tech_app/features/products_collection/domain/repositories/product_collection_repository.dart';

class ProductCollectionRepositoryImpl implements ProductCollectionRepository {
  final ProductCollectionRemoteDatasource remote;

  ProductCollectionRepositoryImpl({required this.remote});

  @override
  Future<List<ProductEntity>> getProducts(String tag) async {
    try {
      return await remote.getProducts(tag);
    } catch (_) {
      rethrow;
    }
  }
}
