import 'package:shared_preferences/shared_preferences.dart';

class ChachedHelper {
  static SharedPreferences? sharedpreferences;

  static init()async{
    sharedpreferences = await  SharedPreferences.getInstance();
    
  }


  static Future<bool> ?putData
  (
    {
      required String key,
      required bool value
    }

  )
  {
   return  sharedpreferences?.setBool(key, value);
    
    
  }


  static bool? getData
  (
    {
      required String key,
      
    }

  )
  {
    
    return sharedpreferences?.getBool(key);
    
  }

 }