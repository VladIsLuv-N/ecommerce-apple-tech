import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_apple_tech_app/core/common/entities/user_entity.dart';
import 'package:ecommerce_apple_tech_app/core/common/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class ProfileRemoteDatasource {
  Future<UserEntity> getUser();
}

class ProfileRemoteDatasourceImpl implements ProfileRemoteDatasource {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  ProfileRemoteDatasourceImpl({required this.firestore, required this.auth});

  @override
  Future<UserEntity> getUser() async {
    try {
      final userId = auth.currentUser!.uid;
      final snapshot = await firestore.collection('users').doc(userId).get();
      final user = UserModel.fromJson(snapshot.data()!);

      return user;
    } catch (_) {
      throw 'GetUserError!';
    }
  }
}
