part of 'app_user_cubit.dart';

sealed class AppUserState {}

final class AppUserInitial extends AppUserState {}

final class AppUserLoggedIn extends AppUserState {
  final UserEntity? user;

  AppUserLoggedIn(this.user);
}
