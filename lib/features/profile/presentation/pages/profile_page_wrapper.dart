import 'package:ecommerce_apple_tech_app/core/di/service_locator.dart';
import 'package:ecommerce_apple_tech_app/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:ecommerce_apple_tech_app/features/profile/presentation/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePageWrapper extends StatelessWidget {
  const ProfilePageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileCubit>()..getUser(),
      child: const ProfilePage(),
    );
  }
}
