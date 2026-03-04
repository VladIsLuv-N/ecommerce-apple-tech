import 'package:ecommerce_apple_tech_app/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:ecommerce_apple_tech_app/features/profile/presentation/cubit/profile_state.dart';
import 'package:ecommerce_apple_tech_app/features/profile/presentation/widgets/profile_body.dart';
import 'package:ecommerce_apple_tech_app/features/profile/presentation/widgets/profile_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return SafeArea(
            bottom: false,
            child: Column(
              children: [
                ProfileHeader(
                  userName: state is ProfileLoaded ? state.user.name : null,
                ),
                const ProfileBody(),
              ],
            ),
          );
        },
      ),
    );
  }
}
