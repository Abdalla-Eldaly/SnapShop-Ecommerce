import 'package:ecommerce_c8_online/api/response/LoginResponse.dart';
import 'package:ecommerce_c8_online/domain/model/AuthResultDto.dart';
import 'package:ecommerce_c8_online/domain/repository/auth_repository.dart';

class LoginUseCase {
  AuthRepository repository;
  LoginUseCase(this.repository);

  Future<AuthResultDto>invoke(String email,String password){
   return repository.login(email, password);
  }
}