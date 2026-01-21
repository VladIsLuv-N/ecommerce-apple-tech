import 'package:ecommerce_apple_tech_app/features/auth/domain/entities/user_entity.dart';
import 'package:ecommerce_apple_tech_app/features/auth/domain/repositories/auth_repository.dart';

class SignUpUsecase {
  final AuthRepository repository;

  SignUpUsecase({required this.repository});

  Future<UserEntity> call({
    required String email,
    required String password,
    required String name,
    required String phoneNumber,
  }) {
    return repository.signUp(email, password, name, phoneNumber);
  }
}

