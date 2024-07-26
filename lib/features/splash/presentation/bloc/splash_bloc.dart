import 'dart:async';

import 'package:blog_app/core/locator.dart';
import 'package:blog_app/features/auth/presentation/pages/sign_in/sign_in_page.dart';
import 'package:blog_app/services/navigation_service/navigation_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<SplashEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<SplashInitializeEvent>(_initialize);
  }

  final _navigation = locator<NavigationService>();

  FutureOr<void> _initialize(
      SplashInitializeEvent event, Emitter<SplashState> emit) {
    Future.delayed(const Duration(seconds: 2), () {
      _navigation.navigateToNamed(SignInPage.routeName);
    });
  }
}
