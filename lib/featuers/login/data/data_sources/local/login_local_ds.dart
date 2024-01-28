import 'package:injectable/injectable.dart';

@injectable
abstract class LoginLocalDs{
  Future<bool>setToken(String token);
  Future<bool>setName(String name);
  Future<bool>setEmail(String email);
}