import 'package:ecommerce_apple_tech_app/core/common/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.userId,
    required super.email,
    required super.name,
    required super.phoneNumber,
    required super.favorites,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'],
      email: json['email'],
      name: json['name'],
      phoneNumber: json['phoneNumber'],
      favorites: (json['favorites'] as List).map((e) => e.toString()).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'phoneNumber': phoneNumber,
      'favorites': favorites,
    };
  }
}
