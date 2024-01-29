import 'package:shared_preferences/shared_preferences.dart';


final _pref = SharedPreferences.getInstance();

class SharedService {
  //ignore: avoid_positional_boolean_parameters
  static Future<void> saveBool(String key, bool value, {String suffix = ''}) async {
    SharedPreferences pref = await _pref;

    pref.setBool(key + suffix, value);
  }

  static Future<void> saveString(String key, String value) async {
    try {
      SharedPreferences pref = await _pref;

      await pref.setString(key, value);
    } catch (_) {}
  }

  static Future<String?> getString(String key) async {
    if (!await hasKey(key)) {
      return null;
    }

    SharedPreferences pref = await _pref;

    return pref.getString(key);
  }

  static Future<bool?> getBool(String key, {String suffix = ''}) async {
    SharedPreferences pref = await _pref;

    return pref.getBool(key + suffix);
  }

  static Future<bool> hasKey(String key, {String suffix = ''}) async {
    SharedPreferences pref = await _pref;

    return pref.containsKey(key + suffix);
  }

  static Future<void> remove(String key, {String suffix = ''}) async {
    SharedPreferences pref = await _pref;

    pref.remove(key + suffix);
  }

  static Future<void> saveStringList(String key, List<String> value, {String suffix = ''}) async {
    SharedPreferences pref = await _pref;

    pref.setStringList(key + suffix, value);
  }

  static Future<List<String>?> getStringList(String key, {String suffix = ''}) async {
    SharedPreferences pref = await _pref;

    return pref.getStringList(key + suffix);
  }
}
