import 'package:ecommerce_apple_tech_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:ecommerce_apple_tech_app/features/auth/domain/entities/user_entity.dart';
import 'package:ecommerce_apple_tech_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource remote;

  AuthRepositoryImpl({required this.remote});

  @override
  Future<UserEntity> signIn(String email, String password) async {
    try {
      return await remote.signIn(email, password);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<UserEntity> signUp(
    String email,
    String password,
    String name,
    String phoneNumber,
  ) async {
    try {
      return await remote.signUp(email, password, name, phoneNumber);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      return await remote.signOut();
    } catch (_) {
      rethrow;
    }
  }

  @override
  bool isAuth() {
    try {
      return remote.currentUser() != null;
    } catch (_) {
      rethrow;
    }
  }

  @override
  User? getUser() {
    try {
      return remote.currentUser();
    } catch (_) {
      rethrow;
    }
  }
}
