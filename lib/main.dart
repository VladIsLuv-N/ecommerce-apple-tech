import 'package:ecommerce_apple_tech_app/apple_tech_app.dart';
import 'package:ecommerce_apple_tech_app/core/router/app_router.dart';
import 'package:ecommerce_apple_tech_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(AppleTechApp(router: appRouter));
}
