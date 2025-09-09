
import 'package:flutter/material.dart';
import 'package:multi_app/controllers/user_controller.dart';
import 'package:multi_app/models/user.dart';

class UserNotifier extends ChangeNotifier {
  User? _user;

  // Getter
  User? get user => _user;

  //Carregar o usuário logado
  Future<void> loadUser()async {
    try{
      _user = await UserController.instance.loggedUSer;
      notifyListeners();
    }catch(e){
      _user = null;
      notifyListeners();
    }
  }

  void logout(){
    _user = null;
    notifyListeners();
  }
}