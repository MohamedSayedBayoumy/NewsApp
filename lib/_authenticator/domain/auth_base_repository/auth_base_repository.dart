import 'package:news_app_clean_architecture/_authenticator/domain/auth_entites/auth_entits.dart';

abstract class AuthBaseRepository {
  Future<AuthModel> login(AuthParameters authParameters);

  Future<AuthModel> register(AuthParameters authParameters);

  Future<AuthModel> addPhoneNumber(AuthParameters authParameters);
}
