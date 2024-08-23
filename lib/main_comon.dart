
import 'package:flutter/material.dart';
import 'package:user_list/core/app/material_app.dart';
import 'package:user_list/core/runner/main_runner.dart';

Future<void> mainCommon() async {
  WidgetsFlutterBinding.ensureInitialized();



  MainRunner.run(appBuilder: () => const MyApp());
}
