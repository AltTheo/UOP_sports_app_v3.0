import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPref {
  static Future<void> saveUserSecureData({String? uuid}) async {
    const securePref = FlutterSecureStorage();
    await securePref.write(key: 'uuid', value: uuid);
  }

  static Future<void> saveAccessCode({required String accessCode}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('access_code', accessCode); 
  }
}
