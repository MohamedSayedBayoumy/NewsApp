 

import '../../domain/auth_base_repository/auth_base_repository.dart';
import '../../domain/auth_entites/auth_entits.dart';
import '../auth_remote_data_source/auth_remote_data.dart';

class AuthRepository extends AuthBaseRepository {
  final BaseRemoteData baseRemoteData;

  AuthRepository(this.baseRemoteData);

  @override
  Future<AuthModel> login(AuthParameters authParameters) async {
    return await baseRemoteData.remoteLogin(authParameters);
  }

  @override
  Future<AuthModel> register(AuthParameters authParameters) async {
    return await baseRemoteData.remoteRegister(authParameters);
  }

  @override
  Future<AuthModel> addPhoneNumber(AuthParameters authParameters) async {
    return await baseRemoteData.addPhoneNumber(authParameters);
  }

  @override
  Future<AuthModel> logOut(AuthParameters authParameters) async {
    return await baseRemoteData.logOut(authParameters);
  }
}
