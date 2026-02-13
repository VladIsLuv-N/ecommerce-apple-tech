import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_apple_tech_app/core/common/entities/product_entity.dart';
import 'package:ecommerce_apple_tech_app/core/common/models/product_model.dart';

abstract class ProductDetailRemoteDatasource {
  Future<ProductEntity> getProduct(String id);
}

class ProductDetailRemoteDatasourceImpl
    implements ProductDetailRemoteDatasource {
  final FirebaseFirestore firestore;

  ProductDetailRemoteDatasourceImpl({required this.firestore});

  @override
  Future<ProductEntity> getProduct(String id) async {
    try {
      final snapshot = await firestore.collection('products').doc(id).get();
      final data = snapshot.data();

      if (data == null) {
        throw 'Product not found';
      }

      final product = ProductModel.fromJson(data);

      return product;
    } catch (_) {
      throw 'Get Product Error!';
    }
  }
}
