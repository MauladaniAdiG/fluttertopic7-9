import 'package:shared_preferences/shared_preferences.dart';

abstract class LoginRepo {
  Future storeData(String email, String password);
}

class LoginSubRepo implements LoginRepo {
  @override
  Future storeData(String email, String password) async {
    final _prefs = await SharedPreferences.getInstance();
    _prefs.setString('email', email);
    _prefs.setString('password', password);
  }
}
