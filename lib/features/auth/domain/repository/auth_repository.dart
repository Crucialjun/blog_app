import 'package:blog_app/core/failure.dart';
import 'package:blog_app/core/entities/user_entity.dart';
import 'package:blog_app/features/auth/domain/params/sign_in_params.dart';
import 'package:blog_app/features/auth/domain/params/sign_up_params.dart';
import 'package:dartz/dartz.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      {required SignInParams params});
  Future<Either<Failure, UserEntity>> signUpWithEmailAndPassword(
      {required SignUpParams params});
  Future<Either<Failure, UserEntity>> currentUserDetails();
}
