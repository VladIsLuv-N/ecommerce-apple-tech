import 'package:ecommerce_apple_tech_app/core/di/service_locator.dart';
import 'package:ecommerce_apple_tech_app/features/categories/presentation/cubit/categories_cubit.dart';
import 'package:ecommerce_apple_tech_app/features/categories/presentation/pages/categories_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesPageWrapper extends StatelessWidget {
  const CategoriesPageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CategoriesCubit>()..getCategories(),
      child: const CategoriesPage(),
    );
  }
}
