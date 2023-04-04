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

  Future<AuthModelData> logOut(AuthParameters authParameters);
}

class RemoteData implements BaseRemoteData {
  @override
  Future<AuthModelData> remoteLogin(AuthParameters authParameters) async {
    final lang = sharedPreferences.getString("Localization").toString();
    try {
      final response = await Dio().post(ApiConstanceAuth.pathLogin,
          options: Options(headers: {
            "lang": lang.toString(),
            "Content-Type": "application/json"
          }),
          queryParameters: {
            "email": authParameters.email,
            "password": authParameters.password
          });
      return AuthModelData.fromJson(response.data);
    } on DioError catch (e) {
      // ignore: avoid_print
      print(e.error);
      return AuthModelData.fromJson(const {"message": "cheak your connection"});
    }
  }

  @override
  Future<AuthModelData> remoteRegister(AuthParameters authParameters) async {
    final lang = sharedPreferences.getString("Localization").toString();
    try {
      final response = await Dio().post(ApiConstanceAuth.pathRegister,
          options: Options(headers: {
            "lang": lang.toString(),
            "Content-Type": "application/json"
          }),
          queryParameters: {
            "email": authParameters.email,
            "password": authParameters.password,
            "phone": authParameters.phone,
            "name": authParameters.name,
            "image": authParameters.image
          });
      return AuthModelData.fromJson(response.data);
    } on DioError catch (e) {
      // ignore: avoid_print
      print(e.error);
      return AuthModelData.fromJson(const {"message": "cheak your connection"});
    }
  }

  @override
  Future<AuthModelData> addPhoneNumber(AuthParameters authParameters) async {
    final lang = sharedPreferences.getString("Localization").toString();
    try {
      final response = await Dio().put(ApiConstanceAuth.pathUpdateProfile,
          options: Options(headers: {
            "lang": lang.toString(),
            "Content-Type": "application/json",
            "Authorization": sharedPreferences.getString("token").toString(),
          }),
          queryParameters: {
            "email": authParameters.email,
            "password": authParameters.password,
            "phone": authParameters.phone,
            "name": authParameters.name,
            "image": authParameters.image
          });

      return AuthModelData.fromJson(response.data);
    } on DioError catch (e) {
      // ignore: avoid_print
      print(e.error);
      return AuthModelData.fromJson(const {"message": "cheak your connection"});
    }
  }

  @override
  Future<AuthModelData> logOut(AuthParameters authParameters) async {
    final lang = sharedPreferences.getString("Localization").toString();
    try {
      final response = await Dio().post(ApiConstanceAuth.logoutProfile,
          options: Options(headers: {
            "lang": lang.toString(),
            "Content-Type": "application/json",
            "Authorization": sharedPreferences.getString("token").toString(),
          }),
          queryParameters: {
            "fcm_token": sharedPreferences.getString("token").toString(),
          });

      return AuthModelData.fromJson(response.data);
    } on DioError catch (e) {
      // ignore: avoid_print
      print(e.error);
      return AuthModelData.fromJson(const {"message": "check your connection"});
    }
  }
}
