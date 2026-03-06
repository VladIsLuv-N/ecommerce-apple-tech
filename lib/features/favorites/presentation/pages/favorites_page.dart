import 'package:ecommerce_apple_tech_app/core/common/widgets/product_item_widget.dart';
import 'package:ecommerce_apple_tech_app/features/favorites/presentation/cubit/favorites_screen_cubit.dart';
import 'package:ecommerce_apple_tech_app/features/favorites/presentation/cubit/favorites_screen_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        leadingWidth: 65,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            context.pop();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ).copyWith(left: 24),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Icon(
                Icons.arrow_back_rounded,
                size: 20,
                color: theme.colorScheme.onPrimary,
              ),
            ),
          ),
        ),
        title: Text('My Wishlist', style: theme.textTheme.displayMedium),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24).copyWith(top: 14, bottom: 0),
        child: BlocBuilder<FavoritesScreenCubit, FavoritesScreenState>(
          builder: (context, state) {
            if (state is FavoritesScreenError) {
              return Center(child: Text(state.message));
            }

            if (state is FavoritesScreenLoading) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.red),
              );
            }

            if (state is FavoritesScreenEmpty) {
              return Center(
                child: Column(
                  crossAxisAlignment: .center,
                  mainAxisSize: .min,
                  children: [
                    SvgPicture.asset('assets/images/favorites_empty.svg'),
                    const SizedBox(height: 16),
                    Text(
                      'You haven’t added any items to your wishlist yet.',
                      style: theme.textTheme.displayMedium,
                      textAlign: .center,
                    ),
                  ],
                ),
              );
            }

            if (state is FavoritesScreenLoaded) {
              return RefreshIndicator(
                strokeWidth: 3,
                elevation: 0,
                backgroundColor: Colors.transparent,
                onRefresh: () async {
                  context.read<FavoritesScreenCubit>().load();
                },
                child: GridView.builder(
                  itemCount: state.favorites.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.60,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemBuilder: (context, index) {
                    return ProductItemWidget(
                      width: double.infinity,
                      height: 188,
                      product: state.favorites[index],
                    );
                  },
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
