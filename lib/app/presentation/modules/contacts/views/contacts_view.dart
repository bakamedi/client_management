import 'package:flutter/widgets.dart';
import 'package:flutter_meedu/consumer.dart';

import '../../../../core/adaptative_screen/adaptative_screen.dart';
import '../../../global/widgets/appbar/custom_appbar_gw.dart';
import '../../../global/widgets/scaffold_body/scaffold_simple_body_gw.dart';
import '../../../global/widgets/state/state_body_gw.dart';
import '../controller/contacts_controller.dart';
import 'widgets/contacts_w.dart';

class ContactsView extends ConsumerWidget {
  final AdaptativeScreen adaptativeScreen;
  const ContactsView({
    super.key,
    required this.adaptativeScreen,
  });

  @override
  Widget build(BuildContext context, BuilderRef ref) {
    final ContactsController controller = ref.watch(contactsProvider);

    return ScaffoldSimpleBodyGW.home(
      adaptativeScreen: adaptativeScreen,
      appBar: CustomAppbarGW.home(
        context: context,
        names: 'Bakke Medina',
        url: 'https://i.postimg.cc/htsKyKNB/temp-Imagex-FMg-Y3.avif',
        contactsLength: 10,
      ),
      body: StateBodyGW(
        stateGU: controller.stategu,
        child: ContactsW(
          contacts: controller.contacts,
        ),
      ),
    );
  }
}
