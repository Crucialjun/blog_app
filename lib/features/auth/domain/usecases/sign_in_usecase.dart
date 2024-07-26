import 'package:blog_app/core/failure.dart';
import 'package:blog_app/core/locator.dart';
import 'package:blog_app/core/usecase.dart';
import 'package:blog_app/core/entities/user_entity.dart';
import 'package:blog_app/features/auth/domain/params/sign_in_params.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class SignInUsecase with UseCases<UserEntity,SignInParams>{
  final _repo = locator<AuthRepository>();
  @override
  Future<Either<Failure, UserEntity>> call(SignInParams params) {
    return _repo.signInWithEmailAndPassword(params: params);
  }
  
}