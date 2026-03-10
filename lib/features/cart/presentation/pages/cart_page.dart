import 'package:ecommerce_apple_tech_app/features/cart/presentation/widgets/cart_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        leadingWidth: 65,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            context.pop();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ).copyWith(left: 24),
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
        title: Text('My Cart', style: theme.textTheme.displayMedium),
      ),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const _TotalItemsText(count: 4),
              const SizedBox(height: 24),
              Expanded(
                child: ListView.separated(
                  itemCount: 4,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 24),
                  itemBuilder: (context, index) {
                    return CartItemWidget(
                      increment: () {},
                      decrement: () {},
                      delete: () {},
                      title: 'Iphone 15',
                      imageUrl:
                          'https://i.ibb.co/pNdFfBv/iphone-15-pro-max-blue-1-Photoroom.png',
                      countItem: 2,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TotalItemsText extends StatelessWidget {
  final int count;
  const _TotalItemsText({required this.count});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return RichText(
      text: TextSpan(
        text: 'Total item ',
        style: theme.textTheme.bodyMedium,
        children: [
          TextSpan(text: '($count items)', style: theme.textTheme.bodyLarge),
        ],
      ),
    );
  }
}
