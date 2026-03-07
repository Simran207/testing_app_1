import 'package:shared_preferences/shared_preferences.dart';

class Sharedpreference {

  static Future<void> saveLogin(String name, String mobile) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('name', name);
    await prefs.setString('mobile', mobile);
    await prefs.setBool('isLoggedIn', true);
  }

  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

static Future<String> getName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('name') ?? "";
  }
  
  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

}