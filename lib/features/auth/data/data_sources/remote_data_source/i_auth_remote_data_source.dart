import 'package:blog_app/core/failure.dart';
import 'package:blog_app/core/locator.dart';
import 'package:blog_app/features/auth/data/data_sources/remote_data_source/auth_remote_data_source.dart';
import 'package:blog_app/features/auth/data/models/user_model.dart';
import 'package:blog_app/features/auth/domain/params/sign_in_params.dart';
import 'package:blog_app/features/auth/domain/params/sign_up_params.dart';
import 'package:blog_app/services/supabase_service/supabase_service.dart';
import 'package:dartz/dartz.dart';
import 'package:gotrue/src/types/session.dart';
import 'package:logger/logger.dart';

class IAuthRemoteDataSource implements AuthRemoteDataSource {
  final supabaseService = locator<SupabaseService>();
  final _logger = Logger();
  @override
  Future<Either<Failure, UserModel>> signInWithEmailAndPassword(
      {required SignInParams params}) async {
    try {
      var res = await supabaseService.signInWithEmailAndPassword(
          email: params.email, password: params.password);

      return Right(UserModel.fromJson(res));
    } on Failure catch (e) {
      _logger.e(e);
      return Left(e);
    } catch (e) {
      _logger.e(e);
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> signUpWithEmailAndPassword(
      {required SignUpParams params}) async {
    try {
      var res = await supabaseService.signUpWithEmailAndPassword(
          name: params.name, email: params.email, password: params.password);
      return Right(UserModel.fromJson(res));
    } on Failure catch (e) {
      _logger.e(e);
      return Left(e);
    } catch (e) {
      _logger.e(e);
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> getCurrentUSerData() async {
    try{
      var res = await supabaseService.getCurrentUserData();
      return Right(UserModel.fromJson(res));
    } on Failure catch (e) {
      _logger.e(e);
      return Left(e);
    } catch (e) {
      _logger.e(e);
      return Left(Failure(e.toString()));
    }
  }

  @override
  
  Session? get session => supabaseService.currentSession;
}
