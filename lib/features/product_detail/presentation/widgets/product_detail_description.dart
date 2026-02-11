import 'package:flutter/material.dart';

class ProductDetailDescription extends StatelessWidget {
  const ProductDetailDescription({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text('Product Description', style: theme.textTheme.bodyLarge),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            'The iPhone 16 Pro Max introduces an advanced A18 Bionic chip, ultra-smooth 120Hz display, and a titanium finish. Capture every detail with its triple-lens camera system, now with enhanced night mode and cinematic video. 256 GB storage ensures ample space for photos, apps, and 4K content — all backed by Ibox official warranty.',
            style: theme.textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}
