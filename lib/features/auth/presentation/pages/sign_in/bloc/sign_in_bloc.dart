import 'dart:async';

import 'package:blog_app/core/cubits/app_user/app_user_cubit.dart';
import 'package:blog_app/core/locator.dart';
import 'package:blog_app/core/entities/user_entity.dart';
import 'package:blog_app/features/auth/domain/params/sign_in_params.dart';
import 'package:blog_app/features/auth/domain/usecases/sign_in_usecase.dart';
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
    on<SignInClickedEvent>(_signInClicked);
  }

  final _navigation = locator<NavigationService>();
  final appUserCubit = locator<AppUserCubit>();

  FutureOr<void> _navigateToSignUpPage(
      NavigateToSignUpPage event, Emitter<SignInState> emit) {
    _navigation.navigateToNamed(SignUpPage.routeName);
  }

  Future<FutureOr<void>> _signInClicked(
      SignInClickedEvent event, Emitter<SignInState> emit) async {
    emit(SignInLoading());

    final res = await SignInUsecase()
        .call(SignInParams(email: event.email, password: event.password));

    res.fold((l) {
      emit(SignInFailure(message: l.message));
    }, (r) {
      appUserCubit.setUser(r);
      emit(SignInSuccess(user: r));
    });
  }
}
