import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_apple_tech_app/core/common/models/category_model.dart';
import 'package:ecommerce_apple_tech_app/core/common/models/product_model.dart';
import 'package:ecommerce_apple_tech_app/features/categories/domain/entities/category_with_products_entity.dart';

abstract class CategoriesRemoteDatasource {
  Future<List<CategoryWithProductsEntity>> getCategoreisWithProducts();
}

class CategoriesRemoteDatasourceImpl implements CategoriesRemoteDatasource {
  final FirebaseFirestore firestore;

  CategoriesRemoteDatasourceImpl({required this.firestore});

  @override
  Future<List<CategoryWithProductsEntity>> getCategoreisWithProducts() async {
    try {
      final categoriesSnapshot = await firestore.collection('categories').get();
      final categories = categoriesSnapshot.docs
          .map((doc) => CategoryModel.fromJson(doc.data()))
          .toList();
      final categoriesWithProducts = await Future.wait(
        categories.map((category) async {
          final productsSnapshot = await firestore
              .collection('products')
              .where('category', isEqualTo: category.id)
              .orderBy('createdAt')
              .limit(6)
              .get();

          final products = productsSnapshot.docs
              .map((product) => ProductModel.fromJson(product.data()))
              .toList();

          return CategoryWithProductsEntity(
            category: category,
            products: products,
          );
        }),
      );

      return categoriesWithProducts;
    } catch (_) {
      throw 'GetCategoriesError!!!';
    }
  }
}
