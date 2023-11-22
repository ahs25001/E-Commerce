import 'package:e_commerce/core/cache/shared_pref.dart';
import 'package:e_commerce/featuers/login/data/data_sources/local/login_local_ds.dart';

class LoginLocalDsImpl extends LoginLocalDs{
  @override
  Future<bool> setToken(String token) {
    return CachedData.saveData("token",token);
  }
}