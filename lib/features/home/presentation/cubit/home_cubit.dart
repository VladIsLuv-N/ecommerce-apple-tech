import 'package:ecommerce_apple_tech_app/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:ecommerce_apple_tech_app/features/home/presentation/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetCategoriesUsecase getCategoriesUseCase;

  HomeCubit({required this.getCategoriesUseCase}) : super(HomeInitial());

  Future<void> getCategories() async {
    try {
      emit(HomeLoading());
      final categories = await getCategoriesUseCase();
      emit(HomeLoaded(categories: categories));
    } catch (e) {
      emit(HomeError(message: e.toString()));
    }
  }
}
