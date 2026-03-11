import 'package:ecommerce_apple_tech_app/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:ecommerce_apple_tech_app/features/cart/presentation/cubit/cart_state.dart';
import 'package:ecommerce_apple_tech_app/features/cart/presentation/widgets/cart_bottom_bar.dart';
import 'package:ecommerce_apple_tech_app/features/cart/presentation/widgets/cart_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state.status == CartStatus.loading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator(color: Colors.red)),
          );
        }

        if (state.status == CartStatus.error) {
          return Scaffold(body: Center(child: Text('${state.errorMesage}')));
        }

        if (state.status == CartStatus.loaded) {
          final cart = state.cart!;

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
            body: cart.cartItems.isEmpty
                ? Center(
                    child: SvgPicture.asset('assets/images/cart_empty.svg'),
                  )
                : SafeArea(
                    bottom: false,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        children: [
                          _TotalItemsText(count: cart.cartItems.length),
                          const SizedBox(height: 24),
                          Expanded(
                            child: ListView.separated(
                              itemCount: cart.cartItems.length,
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 24),
                              itemBuilder: (context, index) {
                                return CartItemWidget(
                                  increment: () =>
                                      context.read<CartCubit>().updateQuantity(
                                        userId: cart.userId,
                                        itemId: cart.cartItems[index].id,
                                        quantity:
                                            cart.cartItems[index].quantity + 1,
                                      ),
                                  decrement: () =>
                                      context.read<CartCubit>().updateQuantity(
                                        userId: cart.userId,
                                        itemId: cart.cartItems[index].id,
                                        quantity:
                                            cart.cartItems[index].quantity - 1,
                                      ),
                                  delete: () =>
                                      context.read<CartCubit>().removeItem(
                                        userId: cart.userId,
                                        itemId: cart.cartItems[index].id,
                                      ),
                                  title: cart.cartItems[index].title,
                                  imageUrl: cart.cartItems[index].imageUrl,
                                  countItem: cart.cartItems[index].quantity,
                                  totalPrice: cart.cartItems[index].subtotal,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
            bottomNavigationBar: CartBottomBar(totalPrice: cart.totalPrice),
          );
        }

        return const SizedBox.shrink();
      },
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
