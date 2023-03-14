import 'package:dartz/dartz.dart';
import 'package:news_app_clean_architecture/_authenticator/domain/auth_base_repository/auth_base_repository.dart';
import 'package:news_app_clean_architecture/_authenticator/domain/auth_entites/auth_entits.dart';

import '../../../core/network/error/error.dart';

class AuthUseCase {
  final AuthBaseRepository authBaseRepository;

  AuthUseCase(this.authBaseRepository);

  Future<Either<ContractFailure, AuthModel>> login (
      AuthParameters parameters) async {
    return await authBaseRepository.login(parameters);
  }

 }
