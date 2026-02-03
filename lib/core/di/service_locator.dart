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
import 'package:ecommerce_apple_tech_app/features/home/presentation/cubit/home_cubit.dart';
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

  getIt.registerFactory(
    () => HomeCubit(
      getCategoriesUseCase: getIt(),
      getMostPopularUsecase: getIt(),
    ),
  );
}
