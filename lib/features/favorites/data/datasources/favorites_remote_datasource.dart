import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class FavoritesRemoteDatasource {
  Stream<Set<String>> getFavoriteIds();
  Future<void> addFavorite(String productId);
  Future<void> removeFavorite(String productId);
}

class FavoritesRemoteDatasourceImpl implements FavoritesRemoteDatasource {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  FavoritesRemoteDatasourceImpl({
    required FirebaseFirestore firestore,
    required FirebaseAuth auth,
  }) : _firestore = firestore,
       _auth = auth;

  String get _userId => _auth.currentUser!.uid;

  DocumentReference get _userDoc => _firestore.collection('users').doc(_userId);

  @override
  Stream<Set<String>> getFavoriteIds() {
    return _userDoc.snapshots().map((doc) {
      final data = doc.data() as Map<String, dynamic>?;

      if (data == null) return <String>{};

      final list = data['favorites'] as List? ?? [];
      return list.map((e) => e.toString()).toSet();
    });
  }

  @override
  Future<void> addFavorite(String productId) async {
    await _userDoc.update({
      'favorites': FieldValue.arrayUnion([productId]),
    });
  }

  @override
  Future<void> removeFavorite(String productId) async {
    await _userDoc.update({
      'favorites': FieldValue.arrayRemove([productId]),
    });
  }
}
