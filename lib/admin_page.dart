import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_apple_tech_app/core/di/service_locator.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final FirebaseFirestore _firestore = getIt<FirebaseFirestore>();

  Future<void> addCategory() async {
    try {
      log('All OK!!!');
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> addItemInCollections() async {
    try {
      await _firestore.collection('categories').doc('accessories').set({
        'id': 'accessories',
        'name': 'Accessories',
        'images': 'POTOM',
        'isActive': true,
        'productCount': 10,
        'metadata': {
          'filters': ['storage', 'color', 'display'],
          'sortOptions': ['price, popularity', 'newest'],
        },
        'createdAt': FieldValue.serverTimestamp(),
      });
      log('All OK!');
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: addItemInCollections,
          child: const Text('Add Data'),
        ),
      ),
    );
  }
}
