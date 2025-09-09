import 'package:flutter/material.dart';
import 'package:multi_app/Shered/app_constants.dart';
import 'package:multi_app/components/app_bar.dart';
import 'package:multi_app/controllers/auth_controller.dart';
//import 'package:multi_app/controllers/user_controller.dart';
import 'package:multi_app/models/user.dart';
import 'package:multi_app/providers/user_notifier.dart';
import 'package:multi_app/views/dashboard_widget.dart/greeting_widget.dart';
import 'package:multi_app/views/profile_pag.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  User? loggedUser;

  @override
  initState(){
    //_getLoggedUser();
    super.initState();
    context.read<UserNotifier>().loadUser();
  }

  // Future<void> _getLoggedUser() async{
  //   User user = await UserController.instance.loggedUSer;
  //   if(mounted){
  //     setState(() {
  //       _loggedUser = user;
  //     });
  //   }
  // }

   @override
    void dispose(){
    //_loggedUser = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final loggedUser = context.watch<UserNotifier?>()?.user;

    return Scaffold(
      appBar: appBar(
        context: context,
        title: AppConstants.appName,
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text('Perfil'),
                onTap: (){
                  if(loggedUser != null){
                    //navega para outra tela de perfil
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProfilePag(user: loggedUser) // ! garante que nesse ponto o usuário n é nulo
                        
                        )
                    );
                  }
                },
                ),

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
            ],
            child: Padding(
              padding: EdgeInsets.only(right: 0.0),
              child: CircleAvatar(
                child: 
                loggedUser != null
                ? Image.network(loggedUser.image.toString
                ())
                : Icon(Icons.person, color: Colors.grey,),
              ),
              ),
          )
        ]
        ),
        //rolagem
        body: SingleChildScrollView( 
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GreetingWidget()
            ],
          ),

        ),
    );
  }
}