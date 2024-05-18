import 'package:blog_app/core/failure.dart';
import 'package:blog_app/core/locator.dart';
import 'package:blog_app/features/auth/data/data_sources/remote_data_source/auth_remote_data_source.dart';
import 'package:blog_app/features/auth/domain/params/sign_up_params.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class IAuthRepository implements AuthRepository {
  final _remoteDatasource = locator<AuthRemoteDataSource>();
  @override
  Future<Either<Failure, String>> signInWithEmailAndPassword(
      {required SignUpParams params}) async {
        return await _remoteDatasource.signInWithEmailAndPassword(params: params);
      }

  @override
  Future<Either<Failure, String>> signUpWithEmailAndPassword(
      {required SignUpParams params}) async {
    return await _remoteDatasource.signUpWithEmailAndPassword(params: params);
  }
}
