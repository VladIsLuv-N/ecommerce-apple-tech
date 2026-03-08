import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_apple_tech_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:ecommerce_apple_tech_app/features/auth/data/repositories_impl/auth_repository_impl.dart';
import 'package:ecommerce_apple_tech_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:ecommerce_apple_tech_app/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:ecommerce_apple_tech_app/features/auth/domain/usecases/is_auth_usecase.dart';
import 'package:ecommerce_apple_tech_app/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:ecommerce_apple_tech_app/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:ecommerce_apple_tech_app/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:ecommerce_apple_tech_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:ecommerce_apple_tech_app/features/categories/data/datasources/categories_remote_datasource.dart';
import 'package:ecommerce_apple_tech_app/features/categories/data/repositories_impl/categories_repository_impl.dart';
import 'package:ecommerce_apple_tech_app/features/categories/domain/repository/categories_repository.dart';
import 'package:ecommerce_apple_tech_app/features/categories/domain/usecases/get_categories_with_products_usecase.dart';
import 'package:ecommerce_apple_tech_app/features/categories/presentation/cubit/categories_cubit.dart';
import 'package:ecommerce_apple_tech_app/features/favorites/data/datasources/favorites_remote_datasource.dart';
import 'package:ecommerce_apple_tech_app/features/favorites/data/repositories_impl/favorites_repository_impl.dart';
import 'package:ecommerce_apple_tech_app/features/favorites/domain/repository/favorites_repository.dart';
import 'package:ecommerce_apple_tech_app/features/favorites/domain/usecases/get_favorite_ids_usecase.dart';
import 'package:ecommerce_apple_tech_app/features/favorites/domain/usecases/get_favorites_by_id_usecase.dart';
import 'package:ecommerce_apple_tech_app/features/favorites/domain/usecases/toggle_favorite_usecase.dart';
import 'package:ecommerce_apple_tech_app/features/favorites/presentation/cubit/favorites_cubit.dart';
import 'package:ecommerce_apple_tech_app/features/favorites/presentation/cubit/favorites_screen_cubit.dart';
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
import 'package:ecommerce_apple_tech_app/features/profile/data/datasources/profile_remote_datasource.dart';
import 'package:ecommerce_apple_tech_app/features/profile/data/repository_impl/profile_repository_impl.dart';
import 'package:ecommerce_apple_tech_app/features/profile/domain/repositories/profile_repositoriy.dart';
import 'package:ecommerce_apple_tech_app/features/profile/domain/usecases/get_user_usecase.dart';
import 'package:ecommerce_apple_tech_app/features/profile/presentation/cubit/profile_cubit.dart';
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
  getIt.registerLazySingleton(() => GetCurrentUserUsecase(repository: getIt()));

  getIt.registerFactory(
    () => AuthCubit(
      signInUseCase: getIt(),
      signUpUseCase: getIt(),
      signOutUseCase: getIt(),
      isAuthUseCase: getIt(),
      getCurrentUserUsecase: getIt(),
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

  getIt.registerLazySingleton(
    () => GetCollectionProuductsUsecase(repository: getIt()),
  );

  getIt.registerFactory(
    () => ProductCollectionCubit(getProuductsUsecase: getIt()),
  );

  //Categories
  getIt.registerLazySingleton<CategoriesRemoteDatasource>(
    () => CategoriesRemoteDatasourceImpl(firestore: getIt()),
  );

  getIt.registerLazySingleton<CategoriesRepository>(
    () => CategoriesRepositoryImpl(remote: getIt()),
  );

  getIt.registerLazySingleton(
    () => GetCategoriesWithProductsUsecase(repository: getIt()),
  );

  getIt.registerFactory(
    () => CategoriesCubit(getCategoriesWithProductsUsecase: getIt()),
  );

  //Profile
  getIt.registerLazySingleton<ProfileRemoteDatasource>(
    () => ProfileRemoteDatasourceImpl(firestore: getIt(), auth: getIt()),
  );

  getIt.registerLazySingleton<ProfileRepositoriy>(
    () => ProfileRepositoryImpl(remote: getIt()),
  );

  getIt.registerLazySingleton(() => GetUserUsecase(repositoriy: getIt()));

  getIt.registerFactory(() => ProfileCubit(getUserUsecase: getIt()));

  //FAvorites
  getIt.registerLazySingleton<FavoritesRemoteDatasource>(
    () => FavoritesRemoteDatasourceImpl(firestore: getIt(), auth: getIt()),
  );

  getIt.registerLazySingleton<FavoritesRepository>(
    () => FavoritesRepositoryImpl(remote: getIt()),
  );

  getIt.registerLazySingleton(() => GetFavoriteIdsUsecase(repository: getIt()));

  getIt.registerLazySingleton(() => ToggleFavoriteUsecase(repository: getIt()));

  getIt.registerLazySingleton(
    () => GetFavoritesByIdUsecase(repository: getIt()),
  );

  getIt.registerLazySingleton(
    () => FavoritesCubit(
      getFavoriteIdsUsecase: getIt(),
      toggleFavoriteUsecase: getIt(),
    ),
  );

  getIt.registerFactory(
    () => FavoritesScreenCubit(getFavoritesByIdUsecase: getIt()),
  );
}
