import 'package:blog_app/core/entities/user_entity.dart';
import 'package:blog_app/core/usecase.dart';
import 'package:blog_app/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

part 'app_user_state.dart';

class AppUserCubit extends Cubit<AppUserState> {
  AppUserCubit() : super(AppUserInitial()) {
    checkUser();
  }

  void checkUser() async {
    final res = await GetCurrentUserUsecase().call(NoParams());

    await res.fold((l) {
      emit(AppUserInitial());
    }, (r) async {
      Logger().i("User is logged in fetched: $r");
      await setUser(r);
    });

    // user.fold((l) {
    //   emit(AppUserInitial());
    // }, (r) {
    //   emit(AppUserLoggedIn(r));
    // });
  }

  Future setUser(UserEntity? user) async {
    if (user == null) {
      emit(AppUserInitial());
    } else {
      emit(AppUserLoggedIn(user));
    }
  }
}
