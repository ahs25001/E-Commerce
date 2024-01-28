import 'package:e_commerce/core/cache/shared_pref.dart';
import 'package:e_commerce/core/utils/app_constants.dart';
import 'package:e_commerce/featuers/login/data/data_sources/local/login_local_ds.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: LoginLocalDs )
class LoginLocalDsImpl extends LoginLocalDs{
  @override
  Future<bool> setToken(String token) {
    AppConstants.token=token??"";
    return CachedData.saveData("token",token);
  }

  @override
  Future<bool> setEmail(String email) {
    AppConstants.email=email??"";
    return CachedData.saveData("email", email);
  }

  @override
  Future<bool> setName(String name) {
    AppConstants.userName=name??"";
    return CachedData.saveData("name", name);
  }
}