part of 'sign_in_bloc.dart';

sealed class SignInState extends Equatable {
  const SignInState();
  
  @override
  List<Object> get props => [];
}

final class SignInInitial extends SignInState {}

final class SignInLoading extends SignInState {}

final class SignInFailure extends SignInState {
  final String message;

  const SignInFailure({required this.message});

  @override
  List<Object> get props => [message];
}

final class SignInSuccess extends SignInState {
  final UserEntity user;

  const SignInSuccess({required this.user});

  @override
  List<Object> get props => [user];
}
