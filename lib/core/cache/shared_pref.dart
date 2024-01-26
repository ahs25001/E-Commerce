import 'package:shared_preferences/shared_preferences.dart';

class CachedData{
  static late SharedPreferences sharedPreferences;
  static init()async{
    sharedPreferences=await SharedPreferences.getInstance();
  }
  static Future<bool> saveData(String key,String data)async{
    return  sharedPreferences.setString(key, data);
  }
  static Future<String?> getData(String key)async{
    return  sharedPreferences.getString(key);
  }
  static Future<bool>deleteData(String key){
    return sharedPreferences.remove(key);
  }
}