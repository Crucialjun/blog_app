import 'dart:async';


import 'package:blog_app/core/cubits/app_user/app_user_cubit.dart';
import 'package:blog_app/core/locator.dart';
import 'package:blog_app/core/entities/user_entity.dart';
import 'package:blog_app/features/auth/domain/params/sign_up_params.dart';
import 'package:blog_app/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:blog_app/features/auth/presentation/pages/sign_in/sign_in_page.dart';
import 'package:blog_app/services/navigation_service/navigation_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<NavigateToSignInPage>(_navigateToSignInPage);
    on<SignUpUserWithEmailAndPassword>(_signUpUserWithEmailAndPassword);
  }

  final _navigation = locator<NavigationService>();
  final appUserCubit = locator<AppUserCubit>();

  FutureOr<void> _navigateToSignInPage(
      NavigateToSignInPage event, Emitter<SignUpState> emit) {
    _navigation.navigateToNamed(SignInPage.routeName);
  }

  FutureOr<void> _signUpUserWithEmailAndPassword(
      SignUpUserWithEmailAndPassword event, Emitter<SignUpState> emit) async {
    emit(SignUpLoading());
    var res = await SignUpUsecase().call(SignUpParams(
      name: event.name,
      email: event.email,
      password: event.password,
    ));

    res.fold((l) {

      emit(SignUpFailure(message: l.message));
    }, (r) {
      appUserCubit.setUser(r);
      emit(SignUpSuccess(user: r));
    });
  }
}
