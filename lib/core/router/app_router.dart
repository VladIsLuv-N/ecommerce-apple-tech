import 'package:ecommerce_apple_tech_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:ecommerce_apple_tech_app/features/auth/presentation/pages/sign_in_page.dart';
import 'package:ecommerce_apple_tech_app/features/auth/presentation/pages/sign_up_page.dart';
import 'package:ecommerce_apple_tech_app/features/home/presentation/pages/home_page_wraper.dart';
import 'package:ecommerce_apple_tech_app/features/onboarding/presentation/pages/onboarding_first_page.dart';
import 'package:ecommerce_apple_tech_app/features/onboarding/presentation/pages/onboarding_layout.dart';
import 'package:ecommerce_apple_tech_app/features/onboarding/presentation/pages/onboarding_second_page.dart';
import 'package:ecommerce_apple_tech_app/features/onboarding/presentation/pages/onboarding_third_page.dart';
import 'package:go_router/go_router.dart';

late final GoRouter appRouter;

void initRouter(AuthCubit cubit) {
  appRouter = GoRouter(
    initialLocation: _determineInitialRoute(cubit),
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return OnboardingLayout(child: child);
        },
        routes: [
          GoRoute(
            path: '/onboarding/first',
            name: 'onboardingFirst',
            pageBuilder: (context, state) {
              return const NoTransitionPage(child: OnboardingFirstPage());
            },
          ),
          GoRoute(
            path: '/onboarding/second',
            name: 'onboardingSecond',
            pageBuilder: (context, state) {
              return const NoTransitionPage(child: OnboardingSecondPage());
            },
          ),
          GoRoute(
            path: '/onboarding/third',
            name: 'onboardingThird',
            pageBuilder: (context, state) {
              return const NoTransitionPage(child: OnboardingThirdPage());
            },
          ),
        ],
      ),
      GoRoute(
        path: '/signIn',
        name: 'signIn',
        builder: (context, state) => const SignInPage(),
      ),
      GoRoute(
        path: '/signUp',
        name: 'signUp',
        builder: (context, state) => const SignUpPage(),
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const HomePageWraper(),
      ),
    ],
  );
}

String _determineInitialRoute(AuthCubit cubit) {
  final isAuth = cubit.isAuth();

  if (isAuth) {
    return '/home';
  } else {
    return '/onboarding/first';
  }
}
