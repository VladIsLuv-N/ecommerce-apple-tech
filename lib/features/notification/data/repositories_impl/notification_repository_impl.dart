import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_apple_tech_app/features/notification/data/models/notification_model.dart';
import 'package:ecommerce_apple_tech_app/features/notification/domain/entities/notification_entity.dart';
import 'package:ecommerce_apple_tech_app/features/notification/domain/repositories/notification_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  NotificationRepositoryImpl({
    required FirebaseAuth auth,
    required FirebaseFirestore firestore,
  }) : _auth = auth,
       _firestore = firestore;

  CollectionReference<Map<String, dynamic>> get _collection {
    final uid = _auth.currentUser!.uid;

    return _firestore.collection('users').doc(uid).collection('notifications');
  }

  @override
  Future<List<NotificationEntity>> getNotifications() async {
    final snapshot = await _collection
        .orderBy('createdAt', descending: true)
        .limit(50)
        .get();

    return snapshot.docs
        .map((doc) => NotificationModel.fromFirebase(doc))
        .toList();
  }

  @override
  Future<void> saveNotification(NotificationEntity notification) async {
    final model = notification as NotificationModel;
    await _collection.doc(model.id).set(model.toFirestore());
  }

  @override
  Future<void> markAsRead(String id) async {
    await _collection.doc(id).update({'isRead': true});
  }

  @override
  Future<void> clearAll() async {
    final snapshot = await _collection.get();
    final batch = _firestore.batch();
    
    for (final doc in snapshot.docs) {
      batch.delete(doc.reference);
    }

    await batch.commit();
  }
}
