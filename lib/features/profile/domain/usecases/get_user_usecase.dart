import 'package:ecommerce_apple_tech_app/core/common/entities/user_entity.dart';
import 'package:ecommerce_apple_tech_app/features/profile/domain/repositories/profile_repositoriy.dart';

class GetUserUsecase {
  final ProfileRepositoriy repositoriy;

  GetUserUsecase({required this.repositoriy});

  Future<UserEntity> call() {
    return repositoriy.getUser();
  }
}
