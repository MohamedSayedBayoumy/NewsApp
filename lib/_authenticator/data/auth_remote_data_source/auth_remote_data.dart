import 'package:dio/dio.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../core/network/error/exception.dart';
import '../../../core/utils/api_constance.dart';
import '../../domain/auth_entites/auth_entits.dart';
import '../auth_model_data/auth_data_model.dart';

abstract class BaseRemoteData {
  Future<AuthModelData> remoteLogin(AuthParameters authParameters);
}

class RemoteData extends BaseRemoteData {
  @override
  Future<AuthModelData> remoteLogin(AuthParameters authParameters) async {
    final response = await Dio().post(AppConstance.pathLogin, queryParameters: {
      "email": authParameters.email,
      "password": authParameters.password
    });

    if (response.data["message"] !=
            "لم نتمكن من تسجيل الدخول برجاء التأكد من البيانات المدخلة" &&
        response.statusCode == 200) {
      return AuthModelData.fromJson(response.data);
    } else {
      print("failure : ${response.data}");
      throw ServerError(failureModel: FailureModel.fromJson(response.data));
    }
  }
}
