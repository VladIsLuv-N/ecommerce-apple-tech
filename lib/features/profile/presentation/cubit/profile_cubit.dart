import 'package:ecommerce_apple_tech_app/features/profile/domain/usecases/get_user_usecase.dart';
import 'package:ecommerce_apple_tech_app/features/profile/presentation/cubit/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetUserUsecase getUserUsecase;

  ProfileCubit({required this.getUserUsecase}) : super(ProfileInit());

  Future<void> getUser() async {
    try {
      emit(ProfileLoading());
      final user = await getUserUsecase();

      emit(ProfileLoaded(user: user));
    } catch (e) {
      emit(ProfileError(message: e.toString()));
    }
  }
}
