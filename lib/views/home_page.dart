import 'package:flutter/material.dart';
import 'package:multi_app/Shered/app_constants.dart';
import 'package:multi_app/components/app_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints){
          double maxWidth = constraints.maxWidth > 500 ? 500 : double.infinity;
          return Center(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxWidth),
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Icon(
                    Icons.dashboard,
                    size: 100,
                    color: Theme.of(context).primaryColor,
                  ),
                  Text(
                    AppConstants.appName,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor
                    ),
                  ),
                  Text(
                    AppConstants.appSlogan,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 40),
                  AppButton(
                    text: 'Entrar',
                    onPressed: (){
                      Navigator.of(context).pushNamed('/login');
                    },
                  ),
                  const SizedBox(height: 24), // separa os botões, cria um espaçamento
                  AppButton(
                    text: 'Cadastrar-se',
                    onPressed: (){},
                  ),
                ],
              ),
            ),
          ),
        ),
      );
        }
        ),
    );
  }
}