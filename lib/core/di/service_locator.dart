import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_apple_tech_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:ecommerce_apple_tech_app/features/auth/data/repositories_impl/auth_repository_impl.dart';
import 'package:ecommerce_apple_tech_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:ecommerce_apple_tech_app/features/auth/domain/usecases/is_auth_usecase.dart';
import 'package:ecommerce_apple_tech_app/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:ecommerce_apple_tech_app/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:ecommerce_apple_tech_app/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:ecommerce_apple_tech_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:ecommerce_apple_tech_app/features/home/data/datasources/home_remote_datasource.dart';
import 'package:ecommerce_apple_tech_app/features/home/data/repositories_impl/home_repository_impl.dart';
import 'package:ecommerce_apple_tech_app/features/home/domain/repositories/home_repository.dart';
import 'package:ecommerce_apple_tech_app/features/home/domain/usecases/get_categories_usecase.dart';
import 'package:ecommerce_apple_tech_app/features/home/domain/usecases/get_most_popular_usecase.dart';
import 'package:ecommerce_apple_tech_app/features/home/domain/usecases/get_new_products_usecase.dart';
import 'package:ecommerce_apple_tech_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:ecommerce_apple_tech_app/features/product_detail/data/datasources/product_detail_remote_datasource.dart';
import 'package:ecommerce_apple_tech_app/features/product_detail/data/repositories_impl/product_detail_repository_impl.dart';
import 'package:ecommerce_apple_tech_app/features/product_detail/domain/repositories/product_detail_repository.dart';
import 'package:ecommerce_apple_tech_app/features/product_detail/domain/usecases/get_product_usecase.dart';
import 'package:ecommerce_apple_tech_app/features/product_detail/presentation/cubit/product_detail_cubit.dart';
import 'package:ecommerce_apple_tech_app/features/products_collection/data/datasources/product_collection_remote_datasource.dart';
import 'package:ecommerce_apple_tech_app/features/products_collection/data/repositories_impl/product_collection_repository_impl.dart';
import 'package:ecommerce_apple_tech_app/features/products_collection/domain/usecases/get_collection_prouducts_usecase.dart';
import 'package:ecommerce_apple_tech_app/features/products_collection/domain/repositories/product_collection_repository.dart';
import 'package:ecommerce_apple_tech_app/features/products_collection/presentation/cubit/product_collection_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.I;

void initGetIt() {
  //Firebase
  getIt.registerLazySingleton(() => FirebaseAuth.instance);
  getIt.registerLazySingleton(() => FirebaseFirestore.instance);

  //Auth
  getIt.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasourceImpl(auth: getIt(), firestore: getIt()),
  );

  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(remote: getIt()),
  );

  getIt.registerLazySingleton(() => SignInUsecase(repository: getIt()));
  getIt.registerLazySingleton(() => SignUpUsecase(repository: getIt()));
  getIt.registerLazySingleton(() => SignOutUsecase(repository: getIt()));
  getIt.registerLazySingleton(() => IsAuthUsecase(repository: getIt()));

  getIt.registerFactory(
    () => AuthCubit(
      signInUseCase: getIt(),
      signUpUseCase: getIt(),
      signOutUseCase: getIt(),
      isAuthUseCase: getIt(),
    ),
  );

  //Home
  getIt.registerLazySingleton<HomeRemoteDatasource>(
    () => HomeRemoteDatasourceImpl(firestore: getIt()),
  );

  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(remote: getIt()),
  );

  getIt.registerLazySingleton(() => GetCategoriesUsecase(repository: getIt()));
  getIt.registerLazySingleton(() => GetMostPopularUsecase(repository: getIt()));
  getIt.registerLazySingleton(() => GetNewProductsUsecase(repository: getIt()));

  getIt.registerFactory(
    () => HomeCubit(
      getCategoriesUseCase: getIt(),
      getMostPopularUsecase: getIt(),
      getNewProductsUsecase: getIt(),
    ),
  );

  //ProductDetail
  getIt.registerLazySingleton<ProductDetailRemoteDatasource>(
    () => ProductDetailRemoteDatasourceImpl(firestore: getIt()),
  );

  getIt.registerLazySingleton<ProductDetailRepository>(
    () => ProductDetailRepositoryImpl(remote: getIt()),
  );

  getIt.registerLazySingleton(() => GetProductUsecase(repository: getIt()));

  getIt.registerFactory(() => ProductDetailCubit(getProductUsecase: getIt()));

  //ProductCollection
  getIt.registerLazySingleton<ProductCollectionRemoteDatasource>(
    () => ProductCollectionRemoteDatasourceImpl(firestore: getIt()),
  );

  getIt.registerLazySingleton<ProductCollectionRepository>(
    () => ProductCollectionRepositoryImpl(remote: getIt()),
  );

  getIt.registerLazySingleton(() => GetCollectionProuductsUsecase(repository: getIt()));

  getIt.registerFactory(
    () => ProductCollectionCubit(getProuductsUsecase: getIt()),
  );
}
