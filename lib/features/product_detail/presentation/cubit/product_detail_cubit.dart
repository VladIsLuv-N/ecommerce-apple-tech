import 'package:ecommerce_apple_tech_app/features/product_detail/domain/usecases/get_product_usecase.dart';
import 'package:ecommerce_apple_tech_app/features/product_detail/presentation/cubit/product_detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  final GetProductUsecase getProductUsecase;

  ProductDetailCubit({required this.getProductUsecase})
    : super(ProductDetailInit());

  Future<void> getProduct(String id) async {
    try {
      emit(ProductDetailLoading());

      final product = await getProductUsecase(id);

      emit(ProductDetailLoaded(product: product));
    } catch (e) {
      emit(ProductDetailError(message: e.toString()));
    }
  }
}
