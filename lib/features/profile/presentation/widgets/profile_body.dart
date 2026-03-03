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
              const MenuItem(
                title: 'My Wishlist',
                icon: Icons.favorite_outline,
              ),
              const MenuItem(
                title: 'My Settings',
                icon: Icons.settings_outlined,
              ),
              const SizedBox(height: 15),
              ListTile(
                onTap: () {
                  context.read<AuthCubit>().signOut();
                  context.goNamed('onboardingFirst');
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
