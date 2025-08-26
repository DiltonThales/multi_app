import 'package:flutter/material.dart';
import 'package:multi_app/Shered/app_constants.dart';
import 'package:multi_app/components/app_bar.dart';
import 'package:multi_app/models/user.dart';

class ProfilePag extends StatelessWidget {

  final User user;


  const ProfilePag({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: appBar(
        context: context,
        title:  AppConstants.appName,
        ),
    );
  }
}