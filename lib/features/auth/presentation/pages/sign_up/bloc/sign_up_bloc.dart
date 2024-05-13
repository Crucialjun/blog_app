import 'dart:async';


import 'package:blog_app/core/locator.dart';
import 'package:blog_app/features/auth/presentation/pages/sign_in/sign_in_page.dart';
import 'package:blog_app/services/navigation_service/navigation_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<NavigateToSignInPage>(_navigateToSignInPage);
  }

  final _navigation = locator<NavigationService>();

  FutureOr<void> _navigateToSignInPage(NavigateToSignInPage event, Emitter<SignUpState> emit) {
    _navigation.navigateToNamed(SignInPage.routeName);

  }
}
