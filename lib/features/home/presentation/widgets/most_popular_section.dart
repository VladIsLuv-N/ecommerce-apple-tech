import 'package:ecommerce_apple_tech_app/core/common/entities/product_entity.dart';
import 'package:ecommerce_apple_tech_app/core/common/widgets/product_item_widget.dart';
import 'package:ecommerce_apple_tech_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:ecommerce_apple_tech_app/features/home/presentation/cubit/home_state.dart';
import 'package:ecommerce_apple_tech_app/features/home/presentation/widgets/section_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MostPopularSection extends StatelessWidget {
  const MostPopularSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeaderWidget(
          title: 'Most Popular',
          onPressed: () {
            context.pushNamed('productsCollection');
          },
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 250,
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeLoading) {
                return const _MostPopularLoadingWidget();
              }

              if (state is HomeLoaded) {
                return _MostPopularList(products: state.popularProducts);
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

class _MostPopularList extends StatelessWidget {
  final List<ProductEntity> products;

  const _MostPopularList({required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: products.length,
      separatorBuilder: (context, index) => const SizedBox(width: 20),
      itemBuilder: (context, index) {
        return ProductItemWidget(
          width: 160,
          height: 160,
          product: products[index],
        );
      },
    );
  }
}

class _MostPopularLoadingWidget extends StatelessWidget {
  const _MostPopularLoadingWidget();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: 6,
      separatorBuilder: (context, index) => const SizedBox(width: 20),
      itemBuilder: (context, index) {
        return const ProductItemWidgetSkeleton(width: 160, height: 160);
      },
    );
  }
}
