import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_list/features/home/presentation/logic/home_controller.dart';
import 'package:user_list/features/home/presentation/widgets/user_profile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
          appBar: AppBar(title: const Text('User List')),
          body: ListView.builder(
            controller: controller.scrollController,
            itemCount: controller.state.users!.length + 1,
            itemBuilder: (context, index) {
              if (index == controller.state.users!.length) {
                return const Center(child: CircularProgressIndicator());
              }

              final user = controller.state.users![index];
              return UserProfile(
                imageUrl: user.result!.picture!.large!,
                fullName:
                    "${user.result!.name!.title} ${user.result!.name!.first} ${user.result!.name!.last}",
                email: user.result!.email!,
                onTap: () {
                  Get.toNamed('/userdetails', arguments: user);
                },
              );
            },
          ));
    });
  }
}
