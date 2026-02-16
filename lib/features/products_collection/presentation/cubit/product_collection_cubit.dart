import 'package:ecommerce_apple_tech_app/features/products_collection/domain/usecases/get_collection_prouducts_usecase.dart';
import 'package:ecommerce_apple_tech_app/features/products_collection/presentation/cubit/product_collection_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCollectionCubit extends Cubit<ProductCollectionState> {
  final GetCollectionProuductsUsecase getProuductsUsecase;

  ProductCollectionCubit({required this.getProuductsUsecase})
    : super(ProductCollectionInit());

  Future<void> getProducts(String tag) async {
    try {
      emit(ProductCollectionLoading());
      final products = await getProuductsUsecase(tag);
      emit(ProductCollectionLoaded(products: products));
    } catch (e) {
      emit(ProductCollectionError(message: e.toString()));
    }
  }
}
