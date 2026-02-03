import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_apple_tech_app/core/common/entities/product_entity.dart';
import 'package:ecommerce_apple_tech_app/core/common/models/product_model.dart';
import 'package:ecommerce_apple_tech_app/features/home/data/models/category_model.dart';
import 'package:ecommerce_apple_tech_app/features/home/domain/entities/category_entity.dart';

abstract class HomeRemoteDatasource {
  Future<List<CategoryEntity>> getCategories();
  Future<List<ProductEntity>> getMostPopular();
  Future<List<ProductEntity>> getNewProducts();
}

class HomeRemoteDatasourceImpl implements HomeRemoteDatasource {
  final FirebaseFirestore firestore;

  HomeRemoteDatasourceImpl({required this.firestore});

  @override
  Future<List<CategoryEntity>> getCategories() async {
    try {
      final snapshot = await firestore.collection('categories').get();
      final categories = snapshot.docs
          .map((doc) => CategoryModel.fromJson(doc.data()))
          .toList();

      return categories;
    } catch (_) {
      throw 'Get Categories Error!';
    }
  }

  @override
  Future<List<ProductEntity>> getMostPopular() async {
    try {
      final snapshot = await firestore
          .collection('products')
          .where('tags', arrayContains: 'popular')
          .orderBy('name')
          .limit(6)
          .get();
      final products = snapshot.docs
          .map((doc) => ProductModel.fromJson(doc.data()))
          .toList();

      return products;
    } catch (_) {
      throw 'Get Most Popular Error!';
    }
  }

  @override
  Future<List<ProductEntity>> getNewProducts() async {
    try {
      final snapshot = await firestore
          .collection('products')
          .where('tags', arrayContains: 'new')
          .orderBy('name')
          .get();
      final products = snapshot.docs
          .map((doc) => ProductModel.fromJson(doc.data()))
          .toList();

      return products;
    } catch (_) {
      throw 'Get New PRoducts Error!';
    }
  }
}
