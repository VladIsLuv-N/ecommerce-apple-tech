import 'package:ecommerce_apple_tech_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:ecommerce_apple_tech_app/features/profile/presentation/widgets/my_purchase_section.dart';
import 'package:ecommerce_apple_tech_app/features/profile/presentation/widgets/my_wallet_section.dart';
import 'package:ecommerce_apple_tech_app/features/profile/presentation/widgets/profile_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24).copyWith(top: 15),
          child: Column(
            children: [
              const MyWalletSection(),
              const SizedBox(height: 15),
              const MyPurchaseSection(),
              const SizedBox(height: 15),
              const MenuItem(title: 'Change password', icon: Icons.key),
              MenuItem(
                title: 'My Wishlist',
                icon: Icons.favorite_outline,
                onTap: () {
                  context.pushNamed('favorites');
                },
              ),
              const MenuItem(
                title: 'My Settings',
                icon: Icons.settings_outlined,
              ),
              const SizedBox(height: 15),
              ListTile(
                onTap: () {
                  showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) {
                      return const _ModalBottomSheetLogout();
                    },
                  );
                },
                contentPadding: const EdgeInsets.all(0),
                leading: Icon(
                  Icons.power_settings_new,
                  color: theme.colorScheme.error,
                ),
                title: Text(
                  'Logout',
                  style: theme.textTheme.bodyLarge!.copyWith(
                    color: theme.colorScheme.error,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                  color: theme.colorScheme.error,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ModalBottomSheetLogout extends StatelessWidget {
  const _ModalBottomSheetLogout();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8).copyWith(bottom: 32),
      child: Container(
        height: 290,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: theme.colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Container(
              height: 64,
              width: 64,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: theme.colorScheme.primary.withAlpha(155),
              ),
              child: Icon(
                Icons.power_settings_new,
                color: theme.colorScheme.primary,
                size: 30,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Logout Account',
              style: theme.textTheme.bodyLarge!.copyWith(fontSize: 20),
            ),
            const SizedBox(height: 8),
            Text(
              'Are your sure to logout from this account?',
              style: theme.textTheme.bodyMedium,
              textAlign: .center,
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: const WidgetStatePropertyAll(
                      Colors.transparent,
                    ),
                    side: WidgetStatePropertyAll(
                      BorderSide(color: theme.colorScheme.primary),
                    ),
                  ),
                  onPressed: () {
                    context.pop();
                  },
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(theme.primaryColor),
                    foregroundColor: WidgetStatePropertyAll(
                      theme.colorScheme.onPrimary,
                    ),
                  ),
                  onPressed: () {
                    context.read<AuthCubit>().signOut();
                    context.goNamed('onboardingFirst');
                  },
                  child: const Text('Logout'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
