import 'package:ecommerce_apple_tech_app/features/auth/domain/usecases/is_auth_usecase.dart';
import 'package:ecommerce_apple_tech_app/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:ecommerce_apple_tech_app/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:ecommerce_apple_tech_app/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:ecommerce_apple_tech_app/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  final SignInUsecase signInUseCase;
  final SignUpUsecase signUpUseCase;
  final SignOutUsecase signOutUseCase;
  final IsAuthUsecase isAuthUseCase;

  AuthCubit({
    required this.signInUseCase,
    required this.signUpUseCase,
    required this.signOutUseCase,
    required this.isAuthUseCase,
  }) : super(AuthInitial());

  Future<void> signIn({required String email, required String password}) async {
    try {
      emit(AuthLoading());

      final user = await signInUseCase(email: email, password: password);

      emit(AuthAuthenticated(user: user));
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> signUp({
    required String email,
    required String password,
    required String name,
    required String phoneNumber,
  }) async {
    try {
      emit(AuthLoading());

      final user = await signUpUseCase(
        email: email,
        password: password,
        name: name,
        phoneNumber: phoneNumber,
      );

      emit(AuthAuthenticated(user: user));
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> signOut() async {
    try {
      emit(AuthLoading());

      await signOutUseCase();

      emit(AuthUnauthenticated());
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  bool isAuth() {
    return isAuthUseCase();
  }
}
