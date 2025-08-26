import 'package:flutter/material.dart';
import 'package:multi_app/Shered/app_constants.dart';
import 'package:multi_app/components/app_bar.dart';
import 'package:multi_app/controllers/auth_controller.dart';
import 'package:multi_app/controllers/user_controller.dart';
import 'package:multi_app/models/user.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  User? _loggedUser;

  Future<void> _getLoggedUser() async{
    User user = await UserController.instance.getById();
    if(mounted){
      setState(() {
        _loggedUser = user;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context: context,
        title: AppConstants.appName,
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                child:Text('sair'),
                onTap: ()async{
                  //Logout
                  final navigator = Navigator.of(context);
                  bool logout = await AuthController.instance.logout();
                  if(logout){
                    navigator.pushReplacementNamed('/');

                  }
                },
                )
            ]
          )
        ]
        ),
    );
  }
}