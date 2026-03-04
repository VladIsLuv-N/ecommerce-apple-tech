import 'package:ecommerce_apple_tech_app/core/common/entities/user_entity.dart';

abstract class ProfileRepositoriy {
  Future<UserEntity> getUser();
}
