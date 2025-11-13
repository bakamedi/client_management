import 'package:go_router/go_router.dart';
import '../../../core/adaptative_screen/adaptive_screen.dart';
import '../../global/widgets/scaffold_body/scaffold_simple_body_gw.dart';
import '../../modules/sign_in/views/sign_in_view.dart';

class SignInRoute {
  static const path = '/sign-in';

  static GoRoute get route {
    return GoRoute(
      path: path,
      name: path,
      builder: (context, __) {
        final adaptiveScreen = AdaptiveScreen(context);

        return ScaffoldSimpleBodyGW.simple(
          adaptiveScreen: adaptiveScreen,
          title: 'Bienvenido',
          body: SignInView(
            adaptiveScreen: adaptiveScreen,
          ),
        );
      },
    );
  }
}
