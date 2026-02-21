import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoryImage extends StatelessWidget {
  final String imageUrl;

  const CategoryImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        color: theme.colorScheme.secondary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}

class CategoryImageSkeleton extends StatelessWidget {
  const CategoryImageSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Skeletonizer(
      child: Container(
        width: 64,
        height: 64,
        decoration: BoxDecoration(
          color: theme.colorScheme.secondary,
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
