import 'package:flutter_meedu/providers.dart';
import 'package:go_router/go_router.dart';

import 'app_routes/contact_route.dart';
import 'app_routes/contacts_route.dart';
import 'app_routes/sign_in_route.dart';
import 'app_routes/sign_up_route.dart';
import 'app_routes/splash_route.dart';

final routerProvider = Provider(
  (ref) => GoRouter(
    initialLocation: SplashRoute.path,
    routes: [
      ContactsRoute.route,
      SignInRoute.route,
      SignUpRoute.route,
      SplashRoute.route,
      ContactRoute.route,
    ],
  ),
);
