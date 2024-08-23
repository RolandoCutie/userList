import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_list/features/home/presentation/logic/user.dart';

class UserDetailsPage extends StatelessWidget {
  const UserDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final User user = Get.arguments;

    return Scaffold(
      appBar: AppBar(title: Text("user.name")),
      body: Column(
        children: [
          ListTile(
            title: Text("user.name"),
            subtitle: Text("user.email"),
          ),
        ],
      ),
    );
  }
}
