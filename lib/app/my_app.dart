import 'package:flutter/material.dart';

import 'core/theme/theme_app_data.dart';
import 'presentation/router/router_provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: routerProvider.read(),
          title: 'App Management',
          theme: ThemeAppData.getTheme(false),
          localizationsDelegates: _getLocalizationsDelegate(),
        ),
      ],
    );
  }

  Iterable<LocalizationsDelegate<dynamic>>? _getLocalizationsDelegate() {
    return [
      DefaultWidgetsLocalizations.delegate,
    ];
  }
}
