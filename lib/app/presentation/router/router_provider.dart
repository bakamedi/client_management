import 'package:flutter_meedu/providers.dart';
import 'package:go_router/go_router.dart';

import 'app_routes/contacts_route.dart';
import 'app_routes/sign_in_route.dart';
import 'app_routes/sign_up_route.dart';

final routerProvider = Provider(
  (ref) => GoRouter(
    initialLocation: SignInRoute.path,
    routes: [
      ContactsRoute.route,
      SignInRoute.route,
      SignUpRoute.route,
    ],
  ),
);
