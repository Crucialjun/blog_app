import 'package:blog_app/core/failure.dart';
import 'package:blog_app/core/locator.dart';
import 'package:blog_app/features/auth/data/data_sources/remote_data_source/auth_remote_data_source.dart';

import 'package:blog_app/features/auth/domain/entities/user_entity.dart';
import 'package:blog_app/features/auth/domain/params/sign_in_params.dart';
import 'package:blog_app/features/auth/domain/params/sign_up_params.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class IAuthRepository implements AuthRepository {
  final _remoteDatasource = locator<AuthRemoteDataSource>();
  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      {required SignInParams params}) async {
        return await _remoteDatasource.signInWithEmailAndPassword(params: params);
      }

  @override
  Future<Either<Failure, UserEntity>> signUpWithEmailAndPassword(
      {required SignUpParams params}) async {
    return await _remoteDatasource.signUpWithEmailAndPassword(params: params);
  }
  
  @override
  Future<Either<Failure, UserEntity>> currentUserDetails() {
    return _remoteDatasource.getCurrentUSerData();
  }
}
