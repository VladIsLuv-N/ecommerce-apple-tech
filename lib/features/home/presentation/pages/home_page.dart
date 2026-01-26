import 'package:ecommerce_apple_tech_app/core/theme/app_colors.dart';
import 'package:ecommerce_apple_tech_app/features/home/presentation/widgets/section_header_widget.dart';
import 'package:flutter/material.dart';

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
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 25),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(child: Text('Banner')),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: theme.textTheme.labelMedium!.copyWith(
                        color: AppColors.inputTextColor,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Search product here',
                        prefixIcon: const Icon(Icons.search_outlined),
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.mic_outlined),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.camera_alt),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              SectionHeaderWidget(title: 'Recently Viewed', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
