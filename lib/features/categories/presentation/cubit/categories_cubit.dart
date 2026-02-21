import 'package:ecommerce_apple_tech_app/features/categories/domain/usecases/get_categories_with_products_usecase.dart';
import 'package:ecommerce_apple_tech_app/features/categories/presentation/cubit/categories_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final GetCategoriesWithProductsUsecase getCategoriesWithProductsUsecase;

  CategoriesCubit({required this.getCategoriesWithProductsUsecase})
    : super(CategoriesInit());

  Future<void> getCategories() async {
    try {
      emit(CategoriesLoading());
      final categories = await getCategoriesWithProductsUsecase();
      emit(CategoriesLoaded(categories: categories));
    } catch (e) {
      emit(CategoriesError(message: e.toString()));
    }
  }
}
