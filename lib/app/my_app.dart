import 'package:flutter/material.dart';

import 'core/adaptative_screen/adaptative_screen.dart';
import 'core/theme/theme_app_data.dart';
import 'presentation/global/widgets/loader/loader_gw.dart';
import 'presentation/router/router_provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final adaptativeScreen = AdaptativeScreen(context);

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
        LoaderGW(
          adaptativeScreen: adaptativeScreen,
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
