
import 'package:dio/dio.dart';

import '../../../core/network/error/exception.dart';
import '../../../core/utils/api_constance.dart';
import '../../domain/auth_entites/auth_entits.dart';
import '../auth_model_data/auth_data_model.dart';

abstract class BaseRemoteData {
  Future<AuthModelData> fetchData(AuthParameters authParameters);
}

class RemoteData extends BaseRemoteData {
  @override
  Future<AuthModelData> fetchData(AuthParameters authParameters) async {
    final response = await Dio().post( AppConstance.pathLogin, queryParameters: {
      "email": authParameters.email,
      "password": authParameters.password
    });

    if (response.statusCode == 200) {
      return AuthModelData.fromJson(response.data);
    } else {
      print("failure : ${response.data}");
      throw ServerError(failureModel: FailureModel.fromJson(response.data));
    }
  }
}
