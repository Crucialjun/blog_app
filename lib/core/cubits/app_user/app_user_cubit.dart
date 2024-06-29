
import 'package:blog_app/core/entities/user_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_user_state.dart';

class AppUserCubit extends Cubit<AppUserState> {
  AppUserCubit() : super(AppUserInitial());

  void setUser(UserEntity? user) {
    if (user == null) {
      emit(AppUserInitial());
      return;
    }else{
      emit(AppUserLoggedIn(user));
    }
    
  }
}
