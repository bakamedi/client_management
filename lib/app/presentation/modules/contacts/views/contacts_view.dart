import 'package:client_management/app/presentation/modules/contacts/views/widgets/create_contact_btn_w.dart';
import 'package:client_management/app/presentation/modules/sign_up/utils/logout.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_meedu/consumer.dart';

import '../../../../core/adaptative_screen/adaptive_screen.dart';
import '../../../global/controllers/session/session_gc.dart';
import '../../../global/utils/state_gu.dart';
import '../../../global/widgets/appbar/custom_appbar_gw.dart';
import '../../../global/widgets/scaffold_body/scaffold_simple_body_gw.dart';
import '../../../global/widgets/state/state_body_gw.dart';
import '../controller/contacts_controller.dart';
import 'widgets/contacts_w.dart';

class ContactsView extends ConsumerWidget {
  const ContactsView({super.key, required this.adaptiveScreen});
  final AdaptiveScreen adaptiveScreen;

  @override
  Widget build(BuildContext context, BuilderRef ref) {
    final ContactsController controller = ref.watch(contactsProvider);
    final SessionGC sessionGC = ref.watch(sessionGP);

    return ScaffoldSimpleBodyGW.home(
      adaptiveScreen: adaptiveScreen,
      floatingActionButton: CreateContactBtnW(),
      appBar: CustomAppbarGW.home(
        context: context,
        names: '${sessionGC.names} ${sessionGC.lastName}',
        url: sessionGC.profileImage,
        onPressed: () => logout(context),
      ),
      body: StateBodyGW(
        stateGU: controller.stategu,
        child: ContactsW(
          contacts: controller.contacts,
          internet: controller.stategu == StateGU.internet,
        ),
      ),
    );
  }
}
