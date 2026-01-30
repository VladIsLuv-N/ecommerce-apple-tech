import 'package:ecommerce_apple_tech_app/core/di/service_locator.dart';
import 'package:ecommerce_apple_tech_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:ecommerce_apple_tech_app/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageWraper extends StatelessWidget {
  const HomePageWraper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<HomeCubit>()..getCategories(),
      child: const HomePage(),
    );
  }
}
