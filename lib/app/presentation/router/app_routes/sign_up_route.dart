import 'package:go_router/go_router.dart';
import '../../../core/adaptative_screen/adaptative_screen.dart';
import '../../global/widgets/scaffold_body/scaffold_simple_body_gw.dart';
import '../../modules/sign_up/views/sign_up_view.dart';

class SignUpRoute {
  static const path = '/sign-up';

  static GoRoute get route {
    return GoRoute(
      path: path,
      name: path,
      builder: (context, __) {
        final adaptativeScreen = AdaptativeScreen(context);

        return ScaffoldSimpleBodyGW.simple(
          adaptativeScreen: adaptativeScreen,
          title: 'Registrate',
          body: SignUpView(
            adaptativeScreen: adaptativeScreen,
          ),
        );
      },
    );
  }
}
