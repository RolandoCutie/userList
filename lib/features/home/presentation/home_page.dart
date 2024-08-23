import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_list/features/home/presentation/logic/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(title: const Text('User List')),
        body: Obx(() {
          if (controller.state.isLoading && controller.state.users!.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            controller:
                controller.scrollController,
            itemCount: controller.state.users!.length + 1,
            itemBuilder: (context, index) {
              if (index == controller.state.users!.length) {
                return const Center(child: CircularProgressIndicator());
              }

              final user = controller.state.users![index];
              return ListTile(
                title: Text(user
                    .results!.name!.title!), 
                subtitle: Text(user.results!.name!.title!),
                onTap: () {
                  Get.toNamed('/user-details', arguments: user);
                },
              );
            },
          );
        }),
      );
    });
  }
}
