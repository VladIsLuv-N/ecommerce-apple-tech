import 'package:ecommerce_apple_tech_app/core/common/entities/user_entity.dart';

abstract class ProfileState {}

class ProfileInit extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final UserEntity user;

  ProfileLoaded({required this.user});
}

class ProfileError extends ProfileState {
  final String message;

  ProfileError({required this.message});
}
