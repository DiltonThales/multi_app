import 'dart:convert';

import 'package:multi_app/Shered/app_constants.dart';
import 'package:multi_app/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class UserController {
  static final UserController instance = UserController();
  late SharedPreferences _sharedPreferences;

  Future<User> get loggedUSer async => getById(_sharedPreferences.getInt('userId')!.toInt());

  Future<User> getById(int id) async{
    // ID
    // Token de Autorização

    _sharedPreferences = await SharedPreferences.getInstance();
    http.Response response = await http.get(
      Uri.parse(
        '${AppConstants.baseAuthApiURL}users/${id.toString()}',
      ),
      headers: <String, String>{
      'Authorization': 'Bearer ${_sharedPreferences.getString('token')}',
      'Content-Type': 'application/json',
      },
    
    );

    print(json.decode(response.body));

    if (response.statusCode == 200){
      // Retonar uma instancia de usuário
      return User.fromJson(json.decode(response.body));
    }else{
      throw Exception('falha ao buscar usuário');
    }
  }
}