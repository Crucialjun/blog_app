import 'package:blog_app/core/failure.dart';
import 'package:blog_app/features/auth/data/models/user_model.dart';
import 'package:blog_app/features/auth/domain/params/sign_in_params.dart';
import 'package:blog_app/features/auth/domain/params/sign_up_params.dart';
import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {
  

  Future<Either<Failure,UserModel>> signInWithEmailAndPassword({required SignInParams params});
 Future<Either<Failure,UserModel>>  signUpWithEmailAndPassword({required SignUpParams params});
 Session? get session;
 Future<Either<Failure,UserModel>> getCurrentUSerData();
}