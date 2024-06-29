import 'package:blog_app/core/failure.dart';
import 'package:blog_app/core/locator.dart';
import 'package:blog_app/core/usecase.dart';
import 'package:blog_app/core/entities/user_entity.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class GetCurrentUserUsecase with UseCases<UserEntity,NoParams>{
  final _repo = locator<AuthRepository>();
  @override
  Future<Either<Failure, UserEntity>> call(NoParams params) {
    return _repo.currentUserDetails();
  }
  
}