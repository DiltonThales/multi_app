import 'package:multi_app/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController {
  static final UserController instance = UserController();
  late SharedPreferences _sharedPreferences;

  Future<User> getById() async{
    // ID
    // Token de Autorização

    _sharedPreferences = await SharedPreferences.getInstance();

  }
}