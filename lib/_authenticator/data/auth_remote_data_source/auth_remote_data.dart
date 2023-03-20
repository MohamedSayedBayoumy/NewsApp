// ignore_for_file: unused_local_variable

import 'package:dio/dio.dart';
import '../../../core/global/globals.dart';
import '../../../core/utils/api_constance.dart';
import '../../domain/auth_entites/auth_entits.dart';
import '../auth_model_data/auth_data_model.dart';

abstract class BaseRemoteData {
  Future<AuthModelData> remoteLogin(AuthParameters authParameters);

  Future<AuthModelData> remoteRegister(AuthParameters authParameters);

  Future<AuthModelData> addPhoneNumber(AuthParameters authParameters);
}

class RemoteData implements BaseRemoteData {
  @override
  Future<AuthModelData> remoteLogin(AuthParameters authParameters) async {
    final lang =sharedPreferences.getString("Localization").toString() ;

    final response = await Dio().post(AppConstance.pathLogin,
        options: Options(headers: {
          "lang":   lang.toString() ,
          "Content-Type": "application/json"
        }),
        queryParameters: {
          "email": authParameters.email,
          "password": authParameters.password
        });

    if (response.data["message"] == "تم تسجيل الدخول بنجاح" ||
        response.data["message"] == "Login done successfully") {
      return AuthModelData.fromJson(response.data);
    } else {
      return AuthModelData.fromJson(response.data);
    }
  }

  @override
  Future<AuthModelData> remoteRegister(AuthParameters authParameters) async {
    final lang =sharedPreferences.getString("Localization").toString() ;

    final response = await Dio().post(AppConstance.pathRegister,
        options: Options(headers: {
          "lang":  lang.toString() ,
          "Content-Type": "application/json"
        }),
        queryParameters: {
          "email": authParameters.email,
          "password": authParameters.password,
          "phone": authParameters.phone,
          "name": authParameters.name,
          "image": authParameters.image
        });
    if (response.data["message"] == "تم تسجيل الدخول بنجاح" ||
        response.data["message"] == "Registration done successfully") {
      print("Success : $response");
      return AuthModelData.fromJson(response.data);
    } else {
      print("Failure : $response");
      return AuthModelData.fromJson(response.data);
    }
  }

  @override
  Future<AuthModelData> addPhoneNumber(AuthParameters authParameters) async {
    final lang =sharedPreferences.getString("Localization").toString() ;
    final response = await Dio().put(AppConstance.pathUpdateProfile,
        options: Options(headers: {
          "lang":  lang.toString() ,
          "Content-Type": "application/json" ,
          "Authorization": sharedPreferences.getString("token").toString()  ,
        }),
        queryParameters: {
          "email": authParameters.email,
          "password": authParameters.password,
          "phone": authParameters.phone,
          "name": authParameters.name,
          "image": authParameters.image
        });
    if (response.data["message"] == "تم التعديل بنجاح" ||
        response.data["message"] == "Updated Successfully") {
      print("Success : $response");
      return AuthModelData.fromJson(response.data);
    } else {
      print("Failure") ;
      return AuthModelData.fromJson(response.data);
    }
  }
}
