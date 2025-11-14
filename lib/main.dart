import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/injection_providers.dart';
import 'app/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await load();
  runApp(const MyApp());
}
