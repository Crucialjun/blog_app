import 'package:blog_app/core/failure.dart';
import 'package:blog_app/features/auth/domain/params/sign_up_params.dart';
import 'package:dartz/dartz.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, String>> signInWithEmailAndPassword(
      {required SignUpParams params});
  Future<Either<Failure, String>> signUpWithEmailAndPassword(
      {required SignUpParams params});
}
