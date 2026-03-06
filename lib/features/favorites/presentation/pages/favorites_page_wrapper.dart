import 'package:ecommerce_apple_tech_app/core/di/service_locator.dart';
import 'package:ecommerce_apple_tech_app/features/favorites/presentation/cubit/favorites_screen_cubit.dart';
import 'package:ecommerce_apple_tech_app/features/favorites/presentation/pages/favorites_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesPageWrapper extends StatelessWidget {
  const FavoritesPageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<FavoritesScreenCubit>()..load(),
      child: const FavoritesPage(),
    );
  }
}
