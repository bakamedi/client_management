import 'package:go_router/go_router.dart';
import '../../../core/adaptative_screen/adaptive_screen.dart';
import '../../global/widgets/scaffold_body/scaffold_simple_body_gw.dart';
import '../../modules/contacts/views/contacts_view.dart';

class ContactsRoute {
  static const path = '/contacts';

  static GoRoute get route {
    return GoRoute(
      path: path,
      name: path,
      builder: (context, __) {
        final adaptiveScreen = AdaptiveScreen(context);

        return ScaffoldSimpleBodyGW.home(
          adaptiveScreen: adaptiveScreen,
          body: ContactsView(
            adaptiveScreen: adaptiveScreen,
          ),
        );
      },
    );
  }
}
