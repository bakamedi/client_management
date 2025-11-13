import 'package:go_router/go_router.dart';
import '../../../core/adaptative_screen/adaptive_screen.dart';
import '../../global/widgets/appbar/custom_appbar_gw.dart';
import '../../global/widgets/scaffold_body/scaffold_simple_body_gw.dart';
import '../../modules/sign_up/views/sign_up_view.dart';

class SignUpRoute {
  static const path = '/sign-up';

  static GoRoute get route {
    return GoRoute(
      path: path,
      name: path,
      builder: (context, __) {
        final adaptiveScreen = AdaptiveScreen(context);

        return ScaffoldSimpleBodyGW.simple(
          adaptiveScreen: adaptiveScreen,
          appBar: CustomAppbarGW.simple(context: context),
          top: 5,
          title: 'Registrate',
          body: SignUpView(
            adaptiveScreen: adaptiveScreen,
          ),
        );
      },
    );
  }
}
