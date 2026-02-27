import 'package:ecommerce_apple_tech_app/features/profile/presentation/widgets/profile_body.dart';
import 'package:ecommerce_apple_tech_app/features/profile/presentation/widgets/profile_header.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const ProfileHeader(),
            const ProfileBody(),
          ],
        ),
      ),
    );
  }
}
