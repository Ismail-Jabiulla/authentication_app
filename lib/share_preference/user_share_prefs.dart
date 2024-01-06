import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  static const String TOKEN = 'isLoggedIn';

  static Future<void> createSession(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(TOKEN, token);
  }

  static Future<String> isLoggedIn(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(TOKEN) ?? "";
  }

  static Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(TOKEN, "");
  }

}
