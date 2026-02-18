import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductsCollectionAppBar extends StatelessWidget {
  final String tag;
  const ProductsCollectionAppBar({super.key, required this.tag});

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
      title: Text(
        'Our ${tag[0].toUpperCase()}${tag.substring(1)} Products',
        style: theme.textTheme.displayMedium,
      ),
    );
  }
}
