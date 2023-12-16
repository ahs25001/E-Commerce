import 'package:e_commerce/core/cache/shared_pref.dart';
import 'package:e_commerce/featuers/home/data/data_sources/local/home_local_ds.dart';

class HomeLocalDsImpl extends HomeLocalDs{
  @override
  Future<String?> getToken() async {
    return await CachedData.getData("token");
  }

}