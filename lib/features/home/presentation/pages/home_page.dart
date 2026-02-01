import 'package:ecommerce_apple_tech_app/core/common/widgets/search_widget.dart';
import 'package:ecommerce_apple_tech_app/features/admin_page.dart';
import 'package:ecommerce_apple_tech_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:ecommerce_apple_tech_app/features/home/presentation/widgets/banner_widget.dart';
import 'package:ecommerce_apple_tech_app/features/home/presentation/widgets/categories_section.dart';
import 'package:ecommerce_apple_tech_app/features/home/presentation/widgets/category_list_widget.dart';
import 'package:ecommerce_apple_tech_app/features/home/presentation/widgets/recently_viewed_widget.dart';
import 'package:ecommerce_apple_tech_app/features/home/presentation/widgets/section_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const CircleAvatar(radius: 24),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Happy Shoping', style: theme.textTheme.bodySmall),
                Text('Vladislav!', style: theme.textTheme.bodyLarge),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.message_outlined),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AdminPage()),
              );
            },
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
          IconButton(
            onPressed: () {
              context.read<AuthCubit>().signOut();
              context.goNamed('onboardingFirst');
            },
            icon: const Icon(Icons.notifications_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const SizedBox(height: 25),
                const BannerWidget(),
                const SizedBox(height: 30),
                const SearchWidget(),
                const SizedBox(height: 25),
                const CategoriesSection(),
                const SizedBox(height: 25),
                SectionHeaderWidget(title: 'Recently Viewed', onPressed: () {}),
                const SizedBox(height: 16),
                const RecentlyViewedWidget(),
                const SizedBox(height: 20),
                SectionHeaderWidget(title: 'Most Popular', onPressed: () {}),
                const SizedBox(height: 16),
                const CategoryListWidget(
                  heightWidget: 250,
                  countItems: 10,
                  widthItem: 160,
                  heightItem: 160,
                  titleItem: 'iPhone 16 Pro Max – 256GB',
                  priceItem: 990,
                  ratingItem: 4.8,
                ),
                const SizedBox(height: 20),
                SectionHeaderWidget(title: 'Special For You', onPressed: () {}),
                const SizedBox(height: 16),
                const CategoryListWidget(
                  heightWidget: 250,
                  countItems: 10,
                  widthItem: 160,
                  heightItem: 160,
                  titleItem: 'Ipad 2025',
                  priceItem: 550,
                  ratingItem: 4.5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
