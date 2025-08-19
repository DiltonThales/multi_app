import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:multi_app/Shered/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';



class AuthController {
  static final AuthController instance = AuthController();
  late SharedPreferences _sharedPreferences;


  Future<bool> login(String username, String password) async {
    http.Response response = await http.post(
      Uri.parse('${AppConstants.baseAuthApiURL}auth/login'),
      headers: <String, String>{'Content-Type': 'application/json'},
      body: jsonEncode(
        {
          'username': username, // emilys
          'password': password, // emilyspass
          'expiresInMins': 30
        }
      ),

    );

    print(response.body);
    print(json.decode(response.body)['acessToken']);

    if(response.statusCode == 200){
      _sharedPreferences = await SharedPreferences.getInstance();
      await _sharedPreferences.setString('acessToken', json.decode(response.body)['acessToken']);
      await _sharedPreferences.setInt('userId', json.decode(response.body)['id']);
      return true;
    }else{
      return false;
    }
    
  }


  Future<bool> verifyToken() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    String? token = _sharedPreferences.getString('acessToken');

    if(token == null){
      return true;
    }else{
      return false;
    }
  }
}
