import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_list/core/navigator/pages.dart';
import 'package:user_list/core/theme/theme_builder.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: buildThemeData(),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.home,
      getPages: Routes.pages(),
    );
  }
}
