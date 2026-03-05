import 'package:ecommerce_apple_tech_app/features/favorites/presentation/cubit/favorites_cubit.dart';
import 'package:ecommerce_apple_tech_app/features/favorites/presentation/cubit/favorites_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddFavoriteButton extends StatelessWidget {
  final String productId;

  const AddFavoriteButton({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<FavoritesCubit, FavoritesState>(
      buildWhen: (previous, current) =>
          previous.isFavorite(productId) != current.isFavorite(productId),
      builder: (context, state) {
        final isFavorite = state.isFavorite(productId);

        return GestureDetector(
          onTap: () {
            context.read<FavoritesCubit>().toggle(productId);
          },
          child: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: theme.colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite
                  ? theme.colorScheme.primary
                  : theme.colorScheme.surface,
              size: 20,
            ),
          ),
        );
      },
    );
  }
}
