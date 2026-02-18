import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_apple_tech_app/core/common/entities/product_entity.dart';
import 'package:ecommerce_apple_tech_app/core/common/models/product_model.dart';

abstract class ProductCollectionRemoteDatasource {
  Future<List<ProductEntity>> getProducts(String tag);
}

class ProductCollectionRemoteDatasourceImpl
    implements ProductCollectionRemoteDatasource {
  final FirebaseFirestore firestore;

  ProductCollectionRemoteDatasourceImpl({required this.firestore});

  @override
  Future<List<ProductEntity>> getProducts(String tag) async {
    try {
      final snapshot = await firestore
          .collection('products')
          .where('tags', arrayContains: tag)
          .orderBy('createdAt')
          .get();
      final products = snapshot.docs
          .map((doc) => ProductModel.fromJson(doc.data()))
          .toList();

      return products;
    } catch (e) {
      throw 'Get $tag products error';
    }
  }
}
