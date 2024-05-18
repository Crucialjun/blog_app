import 'package:blog_app/core/failure.dart';
import 'package:blog_app/features/auth/data/data_sources/remote_data_source/i_auth_remote_data_source.dart';
import 'package:blog_app/features/auth/domain/params/sign_up_params.dart';
import 'package:dartz/dartz.dart';

abstract interface class AuthRemoteDataSource {
  AuthRemoteDataSource(IAuthRemoteDataSource Function() param0);

  Future<Either<Failure,String>> signInWithEmailAndPassword({required SignUpParams params});
 Future<Either<Failure,String>>  signUpWithEmailAndPassword({required SignUpParams params});
}