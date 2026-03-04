import 'package:ecommerce_apple_tech_app/core/common/entities/user_entity.dart';
import 'package:ecommerce_apple_tech_app/features/profile/data/datasources/profile_remote_datasource.dart';
import 'package:ecommerce_apple_tech_app/features/profile/domain/repositories/profile_repositoriy.dart';

class ProfileRepositoryImpl implements ProfileRepositoriy {
  final ProfileRemoteDatasource remote;

  ProfileRepositoryImpl({required this.remote});

  @override
  Future<UserEntity> getUser() async {
    try {
      return await remote.getUser();
    } catch (_) {
      rethrow;
    }
  }
}
