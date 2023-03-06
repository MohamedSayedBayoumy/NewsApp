import 'package:dartz/dartz.dart';
import 'package:news_app_clean_architecture/_authenticator/domain/auth_base_repository/auth_base_repository.dart';
import 'package:news_app_clean_architecture/_authenticator/domain/auth_entites/auth_entits.dart';
import 'package:news_app_clean_architecture/core/base_use_case/use_case_call_method.dart';

import '../../../core/network/error/error.dart';

class AuthUseCase extends BaseUseCaseMethod<AuthModel, AuthParameters> {
  final AuthBaseRepository authBaseRepository;

  AuthUseCase(this.authBaseRepository);

  @override
  Future<Either<Failure, AuthModel>> call(AuthParameters parameters) async {
    return await authBaseRepository.getData(parameters);
  }
}
