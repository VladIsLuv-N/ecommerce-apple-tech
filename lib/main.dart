import 'package:ecommerce_apple_tech_app/apple_tech_app.dart';
import 'package:ecommerce_apple_tech_app/core/di/service_locator.dart';
import 'package:ecommerce_apple_tech_app/core/router/app_router.dart';
import 'package:ecommerce_apple_tech_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:ecommerce_apple_tech_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  initGetIt();

  final authCubit = getIt<AuthCubit>();

  initRouter(authCubit);

  runApp(
    BlocProvider<AuthCubit>(
      create: (context) => getIt<AuthCubit>(),
      child: AppleTechApp(router: appRouter),
    ),
  );
}
