import 'package:e_commerce/core/cache/shared_pref.dart';
import 'package:e_commerce/featuers/edit_passwoed/data/data_sources/local/change_password_lds.dart';

class ChangePasswordLDSImpl extends ChangePasswordLDS{
  @override
  Future<bool> removeToken() {
    return CachedData.deleteData("token");
  }

}