import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {
  static const String STORE_SHOPPING_CART = 'STORE_SHOPPING_CART';

  Future<bool> addStringToSF({String key, String value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, value);
  }

  Future<bool> addIntToSF({String key, int value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setInt(key, value);
  }

  Future<int> getIntValueFromSF({String key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key);
  }

  Future<String> getStringValueFromSF({String key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
}
