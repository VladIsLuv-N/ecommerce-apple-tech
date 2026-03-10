import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CartItemWidget extends StatelessWidget {
  final VoidCallback increment;
  final VoidCallback decrement;
  final VoidCallback delete;
  final String title;
  final String imageUrl;
  final int countItem;

  const CartItemWidget({
    super.key,
    required this.increment,
    required this.decrement,
    required this.delete,
    required this.title,
    required this.imageUrl,
    required this.countItem,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      crossAxisAlignment: .start,
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: theme.colorScheme.secondary,
            borderRadius: BorderRadius.circular(16),
          ),
          child: CachedNetworkImage(
            imageUrl:
                imageUrl,
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: .start,
            mainAxisAlignment: .spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: .spaceEvenly,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: theme.textTheme.bodyLarge,
                      maxLines: 1,
                      overflow: .ellipsis,
                    ),
                  ),
                  IconButton(
                    onPressed: delete,
                    icon: Icon(
                      Icons.delete,
                      color: theme.colorScheme.surface.withAlpha(150),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: increment,
                    child: Container(
                      height: 24,
                      width: 24,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(
                        Icons.remove_rounded,
                        color: theme.colorScheme.onPrimary,
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text('$countItem', style: theme.textTheme.bodyLarge),
                  const SizedBox(width: 16),
                  GestureDetector(
                    onTap: decrement,
                    child: Container(
                      height: 24,
                      width: 24,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(
                        Icons.add_rounded,
                        color: theme.colorScheme.onPrimary,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
