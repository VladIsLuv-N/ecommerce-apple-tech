import 'package:ecommerce_apple_tech_app/core/di/service_locator.dart';
import 'package:ecommerce_apple_tech_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:ecommerce_apple_tech_app/features/cart/presentation/cubit/cart_badge_cubit.dart';
import 'package:ecommerce_apple_tech_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:ecommerce_apple_tech_app/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageWraper extends StatelessWidget {
  const HomePageWraper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<HomeCubit>()..getCategories()),
        BlocProvider(
          create: (context) =>
              getIt<CartBadgeCubit>()
                ..watch(context.read<AuthCubit>().getUser()!.uid),
        ),
      ],
      child: const HomePage(),
    );
  }
}
