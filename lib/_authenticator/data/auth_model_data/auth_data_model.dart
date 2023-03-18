// ignore_for_file: must_be_immutable

//todo import 'package:flutter/material.dart';
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
      data: json["data"] ?? {});
}
