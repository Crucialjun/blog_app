import 'package:blog_app/core/failure.dart';
import 'package:blog_app/core/locator.dart';
import 'package:blog_app/core/usecase.dart';
import 'package:blog_app/features/auth/domain/entities/user_entity.dart';
import 'package:blog_app/features/auth/domain/params/sign_up_params.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class SignUpUsecase implements UseCases<UserEntity, SignUpParams> {
  
  final _repository = locator<AuthRepository>();
  @override
  Future<Either<Failure, UserEntity>> call(SignUpParams params) async {
    return await _repository.signUpWithEmailAndPassword(params: params);
  }
}
