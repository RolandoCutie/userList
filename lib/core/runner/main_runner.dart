import 'package:flutter/material.dart';
import 'package:user_list/core/runner/services.dart';

typedef AppBuilder = Widget Function();

mixin MainRunner {
  static void run({
    required AppBuilder appBuilder,
  }) {
    WidgetsFlutterBinding.ensureInitialized();

    setup();

    runApp(appBuilder());
  }
}
