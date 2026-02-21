import 'package:ecommerce_apple_tech_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GetCurrentUserUsecase {
  final AuthRepository repository;

  GetCurrentUserUsecase({required this.repository});

  User? call() {
    return repository.getUser();
  }
}
