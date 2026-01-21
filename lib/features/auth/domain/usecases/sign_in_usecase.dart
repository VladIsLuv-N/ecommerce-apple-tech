import 'package:ecommerce_apple_tech_app/features/auth/domain/entities/user_entity.dart';
import 'package:ecommerce_apple_tech_app/features/auth/domain/repositories/auth_repository.dart';

class SignInUsecase {
  final AuthRepository repository;

  SignInUsecase({required this.repository});

  Future<UserEntity> call({required String email, required String password}) {
    return repository.signIn(email, password);
  }
}
