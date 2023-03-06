// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class AuthModel extends Equatable {
  bool? status;

  String? message;

  Map<String , dynamic >? data;

  AuthModel({required this.status, required this.message ,
    required this.data

  });

  @override
  List<Object?> get props => [status, message ,
    data
  ];
}

// class DataModel extends Equatable {
//   int? id;
//   String? name;
//   String? email;
//   String? phone;
//   String? image;
//   int? points;
//   int? credit;
//   String? token;
//
//   DataModel(
//       {required this.id,
//        required this.name,
//        required this.email,
//        required this.phone,
//        required this.image,
//        required this.points,
//        required this.credit,
//        required this.token});
//
//   @override
//   List<Object?> get props => [id, name, email, image, points, credit, token];
//
//
// }

class AuthParameters extends Equatable {
  String? email;

  String? password;

  AuthParameters(this.email, this.password);

  @override
  List<Object> get props => [email!, password!];
}
