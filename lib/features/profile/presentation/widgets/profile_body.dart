import 'package:ecommerce_apple_tech_app/features/profile/presentation/widgets/my_wallet_section.dart';
import 'package:flutter/material.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
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
          padding: const EdgeInsets.all(24).copyWith(top: 10),
          child: const Column(children: [MyWalletSection()]),
        ),
      ),
    );
  }
}
