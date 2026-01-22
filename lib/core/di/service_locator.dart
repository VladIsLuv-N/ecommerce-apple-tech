import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_apple_tech_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:ecommerce_apple_tech_app/features/auth/data/repositories_impl/auth_repository_impl.dart';
import 'package:ecommerce_apple_tech_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:ecommerce_apple_tech_app/features/auth/domain/usecases/is_auth_usecase.dart';
import 'package:ecommerce_apple_tech_app/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:ecommerce_apple_tech_app/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:ecommerce_apple_tech_app/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:ecommerce_apple_tech_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.I;

void initGetIt() {
  getIt.registerLazySingleton(() => FirebaseAuth.instance);
  getIt.registerLazySingleton(() => FirebaseFirestore.instance);

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
}
