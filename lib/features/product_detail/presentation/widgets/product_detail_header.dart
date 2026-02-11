import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductDetailHeader extends StatelessWidget {
  final List<String> images;

  const ProductDetailHeader({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        height: 450,
        decoration: BoxDecoration(
          color: theme.colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Stack(
          children: [
            const _AppBarProductDetailHeader(),
            _GalleryProductDetailHeader(images: images),
          ],
        ),
      ),
    );
  }
}

class _GalleryProductDetailHeader extends StatefulWidget {
  final List<String> images;

  const _GalleryProductDetailHeader({required this.images});

  @override
  State<_GalleryProductDetailHeader> createState() =>
      _GalleryProductDetailHeaderState();
}

class _GalleryProductDetailHeaderState
    extends State<_GalleryProductDetailHeader> {
  int _selectedIndex = 0;

  void _onImageSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: SizedBox(
              key: ValueKey(_selectedIndex),
              height: 250,
              width: 250,
              child: CachedNetworkImage(
                imageUrl: widget.images[_selectedIndex],
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: SizedBox(
              width: double.infinity,
              height: 64,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: widget.images.length,
                separatorBuilder: (context, index) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  return _GalleryItem(
                    image: widget.images[index],
                    isSelected: _selectedIndex == index,
                    onTap: () => _onImageSelected(index),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AppBarProductDetailHeader extends StatelessWidget {
  const _AppBarProductDetailHeader();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => context.pop(),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Icon(
                Icons.arrow_back,
                color: theme.colorScheme.onPrimary,
                size: 18,
              ),
            ),
          ),
          Text('Detail Product', style: theme.textTheme.displayMedium),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: theme.colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Icon(
              Icons.favorite,
              color: theme.colorScheme.primary,
              size: 18,
            ),
          ),
        ],
      ),
    );
  }
}

class _GalleryItem extends StatelessWidget {
  final String image;
  final bool isSelected;
  final void Function() onTap;

  const _GalleryItem({
    required this.image,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        height: 64,
        width: 64,
        decoration: BoxDecoration(
          color: theme.colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? theme.colorScheme.primary : Colors.transparent,
            width: isSelected ? 3 : 1,
          ),
        ),
        child: CachedNetworkImage(
          imageUrl: image,
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
