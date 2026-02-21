import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CategoriesAppBar extends StatelessWidget {
  const CategoriesAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SliverAppBar(
      pinned: true,
      toolbarHeight: 60,
      leadingWidth: 40,
      automaticallyImplyLeading: false,
      stretch: true,
      leading: GestureDetector(
        onTap: () {
          context.pop();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
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
      title: Text('All Categories', style: theme.textTheme.displayMedium),
    );
  }
}
