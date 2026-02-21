import 'package:ecommerce_apple_tech_app/core/common/widgets/search_widget.dart';
import 'package:ecommerce_apple_tech_app/features/categories/presentation/cubit/categories_cubit.dart';
import 'package:ecommerce_apple_tech_app/features/categories/presentation/cubit/categories_state.dart';
import 'package:ecommerce_apple_tech_app/features/categories/presentation/widgets/categories_app_bar.dart';
import 'package:ecommerce_apple_tech_app/features/categories/presentation/widgets/categories_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: CustomScrollView(
            slivers: [
              const CategoriesAppBar(),
              const SliverToBoxAdapter(child: SizedBox(height: 14)),
              const SliverToBoxAdapter(child: SearchWidget()),
              const SliverToBoxAdapter(child: SizedBox(height: 16)),
              SliverToBoxAdapter(
                child: Divider(
                  height: 2,
                  color: theme.colorScheme.surface.withAlpha(75),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 24)),
              BlocBuilder<CategoriesCubit, CategoriesState>(
                builder: (context, state) {
                  if (state is CategoriesLoading) {
                    return const CategoriesListSkeleton();
                  }

                  if (state is CategoriesLoaded) {
                    return CategoriesList(categories: state.categories);
                  }

                  if (state is CategoriesError) {
                    return Center(child: Text(state.message));
                  }

                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
