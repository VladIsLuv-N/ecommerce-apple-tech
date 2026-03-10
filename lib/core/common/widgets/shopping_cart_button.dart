import 'package:ecommerce_apple_tech_app/features/cart/presentation/cubit/cart_badge_cubit.dart';
import 'package:ecommerce_apple_tech_app/features/cart/presentation/cubit/cart_badge_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShoppingCartButton extends StatelessWidget {
  final VoidCallback onTap;

  const ShoppingCartButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBadgeCubit, CartBadgeState>(
      builder: (context, state) {
        final isNotEmpty = state.hasItems;

        return IconButton(
          onPressed: onTap,
          icon: isNotEmpty
              ? Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const Icon(Icons.shopping_cart_outlined),
                    Positioned(
                      right: -3,
                      top: -3,
                      child: Container(
                        height: 6,
                        width: 6,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                )
              : const Icon(Icons.shopping_cart_outlined),
        );
      },
    );
  }
}
