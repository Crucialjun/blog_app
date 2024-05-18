part of 'sign_up_bloc.dart';

sealed class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class NavigateToSignInPage extends SignUpEvent {}

class SignUpUserWithEmailAndPassword extends SignUpEvent {
  final String email;
  final String password;
  final String name;

  const SignUpUserWithEmailAndPassword(
      {required this.email, required this.password, required this.name});
}
