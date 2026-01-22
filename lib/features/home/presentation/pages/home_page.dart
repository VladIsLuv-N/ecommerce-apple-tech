import 'package:ecommerce_apple_tech_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Home Page'),
            TextButton(
              onPressed: () {
                context.read<AuthCubit>().signOutUseCase();
                context.goNamed('onboardingFirst');
              },
              child: const Text('SignOut'),
            ),
          ],
        ),
      ),
    );
  }
}
