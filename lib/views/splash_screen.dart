import 'package:flutter/material.dart';
import 'package:multi_app/components/reponse_container.dart';
import 'package:multi_app/controllers/auth_controller.dart';
import 'package:multi_app/providers/user_notifier.dart';
import 'package:provider/provider.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    _init();
  }

  Future<void> _init() async{

    final currentContext = context.read<UserNotifier>();

    //Delay forçado
    await Future.delayed(Duration(milliseconds: 3000));

    bool hasToken = await AuthController.instance.verifyToken();
    if(!mounted) return;

    if(hasToken){
      await currentContext.loadUser();
    }

    Navigator.of(context).pushReplacementNamed(hasToken ? '/dashboard' : '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveContainer(
        child: Center(
          child: Column(
            children: [
              CircularProgressIndicator(),
              Text("Carregando...")
            ],
          ),
        ),
        
        ),
    );
  }
}