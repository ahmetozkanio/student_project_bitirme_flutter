import 'package:shared_preferences/shared_preferences.dart';

class CacheManager {
  final String _isStaff = "IS_STAFF";
  final String _id = "ID";
  final String _token = "TOKEN";

  Future<bool> saveTokenId(String token, int id, bool isStaff) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_token, token);
    prefs.setInt(_id, id);
    prefs.setBool(_isStaff, isStaff);

    return true;
  }

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_token.toString());
  }

  Future<int?> getAuthUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_id);
  }

  Future<bool?> getAuthUserIsStaff() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isStaff);
  }

  Future<bool?> removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(_id);
    prefs.remove(_token);
    prefs.remove(_isStaff);

    return prefs.getString(_token) != null ? true : false;
  }
}

// enum CacheManagerKey { TOKEN, ID, IS_STAFF }
