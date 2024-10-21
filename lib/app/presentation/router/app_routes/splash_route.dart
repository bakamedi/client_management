import 'package:go_router/go_router.dart';
import '../../modules/splash/views/splash_view.dart';

class SplashRoute {
  static const path = '/splash';

  static GoRoute get route {
    return GoRoute(
      path: path,
      name: path,
      builder: (context, __) => const SplashView(),
    );
  }
}
