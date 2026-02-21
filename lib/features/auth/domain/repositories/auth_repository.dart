import 'package:ecommerce_apple_tech_app/features/auth/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<UserEntity> signIn(String email, String password);

  Future<UserEntity> signUp(
    String email,
    String password,
    String name,
    String phoneNumber,
  );

  Future<void> signOut();

  bool isAuth();

  User? getUser();
}
