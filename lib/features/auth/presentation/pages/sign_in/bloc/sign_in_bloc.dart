import 'dart:async';

import 'package:blog_app/core/locator.dart';
import 'package:blog_app/features/auth/presentation/pages/sign_up/sign_up_page.dart';
import 'package:blog_app/services/navigation_service/navigation_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<SignInEvent>((event, emit) {});
    on<NavigateToSignUpPage>(_navigateToSignUpPage);
  }

  final _navigation = locator<NavigationService>();

  FutureOr<void> _navigateToSignUpPage(
      NavigateToSignUpPage event, Emitter<SignInState> emit) {
    _navigation.navigateToNamed(SignUpPage.routeName);
  }
}
