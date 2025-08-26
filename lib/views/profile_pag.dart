import 'package:flutter/material.dart';
import 'package:multi_app/Shered/app_constants.dart';
import 'package:multi_app/components/app_bar.dart';
import 'package:multi_app/components/reponse_container.dart';
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
      body: ResponsiveContainer(
        child: Column(
          crossAxisAlignment:  CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              child : user.image != null ? Image.network(user.image!) : 
              Icon(Icons.person),
            )
          ],
        )
        ),
    );
  }
}