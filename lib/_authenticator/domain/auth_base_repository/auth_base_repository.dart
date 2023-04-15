 
import '../auth_entites/auth_entits.dart';

abstract class AuthBaseRepository {
  Future<AuthModel> login(AuthParameters authParameters);

  Future<AuthModel> register(AuthParameters authParameters);

  Future<AuthModel> addPhoneNumber(AuthParameters authParameters);

  Future<AuthModel> logOut(AuthParameters authParameters);
}
