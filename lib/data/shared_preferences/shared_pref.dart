import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopme_admin/data/shared_preferences/shared_pref_key.dart';

class SharedPref {
  static late SharedPreferences sharePref;

  static Future<void> ensureInitialized() async {
    sharePref = await SharedPreferences.getInstance();
  }

  void storeToken(String token) {
    sharePref.setString(SharedPrefKey.TOKEN, token);
  }

  String get token => sharePref.getString(SharedPrefKey.TOKEN) ?? "";
}
