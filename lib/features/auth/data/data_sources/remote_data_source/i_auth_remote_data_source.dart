import 'package:blog_app/core/failure.dart';
import 'package:blog_app/core/locator.dart';
import 'package:blog_app/features/auth/data/data_sources/remote_data_source/auth_remote_data_source.dart';
import 'package:blog_app/features/auth/domain/params/sign_up_params.dart';
import 'package:blog_app/services/supabase_service/supabase_service.dart';
import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';

class IAuthRemoteDataSource implements AuthRemoteDataSource{
  final supabaseService = locator<SupabaseService>();
  final _logger = Logger();
  @override
  Future<Either<Failure, String>> signInWithEmailAndPassword({required SignUpParams params}) {
    // TODO: implement signInWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> signUpWithEmailAndPassword({required SignUpParams params}) {
    try {
      
    } on Failure catch (e) {
      
    }
    
    catch (e) {
      
    }
  }
  
}