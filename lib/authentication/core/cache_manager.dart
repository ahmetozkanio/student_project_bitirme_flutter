import 'package:shared_preferences/shared_preferences.dart';

class CacheManager {
  Future<bool> saveTokenId(String token, String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(CacheManagerKey.TOKEN.toString(), token);
    prefs.setString(CacheManagerKey.ID.toString(), id);
    return true;
  }

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(CacheManagerKey.TOKEN.toString());
  }

  Future<bool?> removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('CacheManagerKey.TOKEN');
    prefs.remove('CacheManagerKey.ID');
    return prefs.getString(CacheManagerKey.TOKEN.toString()) != null
        ? true
        : false;
  }
}

enum CacheManagerKey { TOKEN, ID }
