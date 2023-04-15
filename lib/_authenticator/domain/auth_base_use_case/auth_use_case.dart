
 
import '../auth_base_repository/auth_base_repository.dart';
import '../auth_entites/auth_entits.dart';

class AuthUseCase {
  final AuthBaseRepository authBaseRepository;

  AuthUseCase(this.authBaseRepository);

  Future<AuthModel> login(AuthParameters parameters) async {
    return await authBaseRepository.login(parameters);
  }

  Future<AuthModel> register(AuthParameters parameters) async {
    return await authBaseRepository.register(parameters);
  }
  Future<AuthModel> addPhoneNumber(AuthParameters parameters) async {
    return await authBaseRepository.addPhoneNumber(parameters);
  }

  Future<AuthModel> logOut(AuthParameters parameters) async {
    return await authBaseRepository.logOut(parameters);
  }
}
