import 'package:ecommerce_apple_tech_app/core/di/service_locator.dart';
import 'package:ecommerce_apple_tech_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:ecommerce_apple_tech_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:ecommerce_apple_tech_app/features/cart/presentation/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPageWrapper extends StatelessWidget {
  const CartPageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<CartCubit>()
            ..watchCart(context.read<AuthCubit>().getUser()!.uid),
      child: const CartPage(),
    );
  }
}
