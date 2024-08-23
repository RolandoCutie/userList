import 'package:get/get.dart';
import 'package:user_list/features/home/presentation/home_page.dart';
import 'package:user_list/features/home/presentation/pages/user_detail.dart';

class AppRoutes {
  static final routes = [
    GetPage(name: '/', page: () => const HomePage()),
    GetPage(name: '/user-details', page: () => const UserDetailsPage()),
  ];
}
