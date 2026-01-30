import 'package:ecommerce_apple_tech_app/features/home/domain/entities/category_entity.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<CategoryEntity> categories;

  HomeLoaded({required this.categories});
}

class HomeError extends HomeState {
  final String message;

  HomeError({required this.message});
}
