import 'package:ecommerce_apple_tech_app/features/auth/data/models/user_model.dart';
import 'package:ecommerce_apple_tech_app/features/auth/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class AuthRemoteDatasource {
  Future<UserEntity> signIn(String email, String password);
  Future<UserEntity> signUp(
    String email,
    String password,
    String name,
    String phoneNumber,
  );
  Future<void> signOut();
  User? currentUser();
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  AuthRemoteDatasourceImpl({required this.auth, required this.firestore});

  @override
  Future<UserEntity> signIn(String email, String password) async {
    try {
      final credential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final doc = await firestore
          .collection('users')
          .doc(credential.user!.uid)
          .get();

      return UserModel.fromJson(doc.data()!);
    } catch (e) {
      throw 'SignIn Error!!!';
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
      final credential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = UserModel(
        userId: credential.user!.uid,
        email: email,
        name: name,
        phoneNumber: phoneNumber,
      );

      await firestore.collection('users').doc(user.userId).set(user.toJson());

      return user;
    } catch (e) {
      throw 'SignUp Error!!!';
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      throw 'SignOut Error!!!';
    }
  }

  @override
  User? currentUser() {
    try {
      return auth.currentUser;
    } catch (_) {
      throw 'CurrentUser Error!!!';
    }
  }
}
