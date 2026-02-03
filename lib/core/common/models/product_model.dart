import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_apple_tech_app/core/common/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required super.id,
    required super.name,
    required super.description,
    required super.category,
    required super.images,
    required super.specification,
    required super.isAvailable,
    required super.price,
    required super.rating,
    required super.reviewsCount,
    required super.stock,
    required super.tags,
    required super.createdAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      category: json['category'],
      images: (json['images'] as List).map((e) => e.toString()).toList(),
      specification: json['specification'] as Map<String, dynamic>,
      isAvailable: json['isAvailable'],
      price: (json['price'] as num).toDouble(),
      rating: json['rating'],
      reviewsCount: json['reviewsCount'],
      stock: json['stock'],
      tags: (json['tags'] as List).map((e) => e.toString()).toList(),
      createdAt: (json['createdAt'] as Timestamp).toDate(),
    );
  }
}
