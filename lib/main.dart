import 'package:flutter/material.dart';
import 'package:multi_app/Shered/app_constants.dart';
import 'package:multi_app/Shered/app_theme.dart';
import 'package:multi_app/views/dashboard_page.dart';
import 'package:multi_app/views/home_page.dart';
import 'package:multi_app/views/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: AppConstants.appName,
      theme: AppTheme.lightTheme, //Carrea os dois temos para dentro do app
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system, //Define qual tema será usado
      initialRoute: '/',

      routes: {
        '/': (context) => HomePage(),
        '/login': (context) => LoginPage(),
        '/dashboard': (context) => DashboardPage()
      },
    );
  }
}

