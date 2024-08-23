import 'package:get/get.dart';
import 'package:user_list/features/home/presentation/home_page.dart';
import 'package:user_list/features/home/presentation/pages/user_detail.dart';

class Routes {
  static String get home => "/home";

  static String get userdetails => "/userdetails";

  static List<GetPage> pages() => <GetPage>[
        GetPage(name: home, page: () => const HomePage()),
        GetPage(name: userdetails, page: () => const UserDetailsPage()),
      ];
}
