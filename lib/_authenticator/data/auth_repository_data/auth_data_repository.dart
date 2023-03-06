import 'package:dartz/dartz.dart';
import 'package:news_app_clean_architecture/_authenticator/data/auth_remote_data_source/auth_remote_data.dart';
import 'package:news_app_clean_architecture/_authenticator/domain/auth_base_repository/auth_base_repository.dart';
import 'package:news_app_clean_architecture/_authenticator/domain/auth_entites/auth_entits.dart';

import '../../../core/network/error/error.dart';
import '../../../core/network/error/exception.dart';

class AuthRepository extends AuthBaseRepository{
  final BaseRemoteData baseRemoteData ;


  AuthRepository(this.baseRemoteData);


  @override
  Future<Either<Failure, AuthModel>> getData(AuthParameters authParameters) async {
    final result = await baseRemoteData.fetchData(authParameters);
    try{
      return Right(result);
    } on ServerError catch(failure) {
      return Left(FailureStatue(message: failure.failureModel.message ,status: failure.failureModel.status));
    }
  }
}