import 'package:dartz/dartz.dart';
import 'package:news_app_clean_architecture/_authenticator/domain/auth_entites/auth_entits.dart';

import '../../../core/base_use_case/use_case_call_method.dart';
import '../../../core/network/error/error.dart';

abstract class AuthBaseRepository {
  Future<Either<ContractFailure, AuthModel>> login(
      AuthParameters authParameters);


}
