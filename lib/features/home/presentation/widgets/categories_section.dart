import 'package:ecommerce_apple_tech_app/core/common/entities/category_entity.dart';
import 'package:ecommerce_apple_tech_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:ecommerce_apple_tech_app/features/home/presentation/cubit/home_state.dart';
import 'package:ecommerce_apple_tech_app/features/home/presentation/widgets/category_item.dart';
import 'package:ecommerce_apple_tech_app/core/common/widgets/section_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeaderWidget(
          title: 'Our Categories',
          buttonTitle: 'See All',
          onPressed: () {
            context.pushNamed('categories');
          },
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 110,
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeLoading) {
                return const _CategoriesLoadingWidget();
              }

              if (state is HomeLoaded) {
                return _CategoriesList(categories: state.categories);
              }

              if (state is HomeError) {
                return Center(child: Text(state.message));
              }

              return const SizedBox.shrink();
            },
          ),
        ),
      ],
    );
  }
}

class _CategoriesList extends StatelessWidget {
  final List<CategoryEntity> categories;
  const _CategoriesList({required this.categories});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      separatorBuilder: (context, index) => const SizedBox(width: 10),
      itemBuilder: (context, index) {
        return CategoryItem(category: categories[index]);
      },
    );
  }
}

class _CategoriesLoadingWidget extends StatelessWidget {
  const _CategoriesLoadingWidget();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: 6,
      separatorBuilder: (context, index) => const SizedBox(width: 10),
      itemBuilder: (context, index) {
        return const CategoryItemSkeleton();
      },
    );
  }
}
