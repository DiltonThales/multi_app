import 'package:flutter/material.dart';
import 'package:multi_app/components/reponse_container.dart';


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