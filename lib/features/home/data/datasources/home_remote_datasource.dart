import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_apple_tech_app/features/home/data/models/category_model.dart';
import 'package:ecommerce_apple_tech_app/features/home/domain/entities/category_entity.dart';

abstract class HomeRemoteDatasource {
  Future<List<CategoryEntity>> getCategories();
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
}
