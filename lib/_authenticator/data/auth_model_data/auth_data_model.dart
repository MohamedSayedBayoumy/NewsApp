// ignore_for_file: must_be_immutable

import 'package:news_app_clean_architecture/_authenticator/domain/auth_entites/auth_entits.dart';

class AuthModelData extends AuthModel {
  AuthModelData({
    required super.status,
    required super.message,
    required super.data,
  });

  factory AuthModelData.fromJson(Map<String, dynamic> json) => AuthModelData(
      status: json["status"],
      message: json["message"],
      data:  json["data"]

  );
}

// class AuthDataUserModel extends DataModel {
//   AuthDataUserModel(
//       {required super.id,
//       required super.name,
//       required super.email,
//       required super.phone,
//       required super.image,
//       required super.points,
//       required super.credit,
//       required super.token});
//
//   factory AuthDataUserModel.fromJson(Map<String, dynamic> json) =>
//       AuthDataUserModel(
//           email: json["email"],
//           id: json["id"],
//           name: json["name"],
//           image: json["image"],
//           phone: json["phone"],
//           credit: json["credit"],
//           points: json["points"],
//           token: json["token"]);
// }
