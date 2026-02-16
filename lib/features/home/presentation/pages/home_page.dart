import 'package:ecommerce_apple_tech_app/core/common/widgets/search_widget.dart';
import 'package:ecommerce_apple_tech_app/admin_page.dart';
import 'package:ecommerce_apple_tech_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:ecommerce_apple_tech_app/core/common/widgets/banner_widget.dart';
import 'package:ecommerce_apple_tech_app/features/home/presentation/widgets/categories_section.dart';
import 'package:ecommerce_apple_tech_app/features/home/presentation/widgets/most_popular_section.dart';
import 'package:ecommerce_apple_tech_app/features/home/presentation/widgets/new_products_section.dart';
// import 'package:ecommerce_apple_tech_app/features/home/presentation/widgets/recently_viewed_widget.dart';
// import 'package:ecommerce_apple_tech_app/features/home/presentation/widgets/section_header_widget.dart';
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
      body: const SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                SizedBox(height: 25),
                BannerWidget(
                  color: Colors.deepOrangeAccent,
                ),
                SizedBox(height: 30),
                SearchWidget(),
                SizedBox(height: 25),
                CategoriesSection(),
                SizedBox(height: 25),
                // SectionHeaderWidget(title: 'Recently Viewed', onPressed: () {}),
                // const SizedBox(height: 16),
                // const RecentlyViewedWidget(),
                // const SizedBox(height: 20),
                MostPopularSection(),
                SizedBox(height: 20),
                NewProductsSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
