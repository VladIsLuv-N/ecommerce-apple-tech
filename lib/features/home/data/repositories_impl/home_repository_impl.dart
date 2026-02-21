import 'package:ecommerce_apple_tech_app/core/common/entities/product_entity.dart';
import 'package:ecommerce_apple_tech_app/features/home/data/datasources/home_remote_datasource.dart';
import 'package:ecommerce_apple_tech_app/core/common/entities/category_entity.dart';
import 'package:ecommerce_apple_tech_app/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDatasource remote;

  HomeRepositoryImpl({required this.remote});

  @override
  Future<List<CategoryEntity>> getCategories() async {
    try {
      return await remote.getCategories();
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<ProductEntity>> getMostPopular() async {
    try {
      return await remote.getMostPopular();
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<ProductEntity>> getNewProducts() async {
    try {
      return await remote.getNewProducts();
    } catch (_) {
      rethrow;
    }
  }
}
