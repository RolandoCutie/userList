import 'package:get/get.dart';
import 'package:user_list/core/data/remote_ds.dart';
import 'package:user_list/features/home/data/remote_ds/home_remote.dart';
import 'package:user_list/features/home/data/repositories/repositories.dart';
import 'package:user_list/features/home/logic/get_users.dart';
import 'package:user_list/features/home/presentation/logic/home_controller.dart';

void setup() {
  Get.lazyPut(() => ApiProvider(), fenix: true);
  Get.lazyPut(() => HomeRemoteDs(Get.find()), fenix: true);
  Get.lazyPut(() => HomeRepository(Get.find()), fenix: true);
  Get.lazyPut(() => GetUsersUseCase(Get.find()), fenix: true);
  Get.lazyPut(() => HomeController(Get.find()), fenix: true);
}
