import 'package:ecommerce_apple_tech_app/features/auth/domain/repositories/auth_repository.dart';

class IsAuthUsecase {
  final AuthRepository repository;

  IsAuthUsecase({required this.repository});

  bool call() {
    return repository.isAuth();
  }
}
