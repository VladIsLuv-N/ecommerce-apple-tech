import 'package:ecommerce_apple_tech_app/features/categories/data/datasources/categories_remote_datasource.dart';
import 'package:ecommerce_apple_tech_app/features/categories/domain/entities/category_with_products_entity.dart';
import 'package:ecommerce_apple_tech_app/features/categories/domain/repository/categories_repository.dart';

class CategoriesRepositoryImpl implements CategoriesRepository {
  final CategoriesRemoteDatasource remote;

  CategoriesRepositoryImpl({required this.remote});

  @override
  Future<List<CategoryWithProductsEntity>> getCategories() async {
    try {
      return await remote.getCategoreisWithProducts();
    } catch (_) {
      rethrow;
    }
  }
}
