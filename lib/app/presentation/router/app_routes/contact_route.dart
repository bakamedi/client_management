import 'package:go_router/go_router.dart';
import '../../../core/adaptative_screen/adaptive_screen.dart';
import '../../modules/contact/views/contact_view.dart';

class ContactRoute {
  static const path = '/contact';

  static GoRoute get route {
    return GoRoute(
      path: path,
      name: path,
      builder: (context, __) {
        final adaptiveScreen = AdaptiveScreen(context);

        return ContactView(
          adaptiveScreen: adaptiveScreen,
        );
      },
    );
  }
}
