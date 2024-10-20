import 'package:flutter/widgets.dart';

import '../../../../core/adaptative_screen/adaptative_screen.dart';
import '../../../global/widgets/appbar/custom_appbar_gw.dart';
import '../../../global/widgets/scaffold_body/scaffold_simple_body_gw.dart';

class ContactsView extends StatelessWidget {
  final AdaptativeScreen adaptativeScreen;
  const ContactsView({
    super.key,
    required this.adaptativeScreen,
  });

  @override
  Widget build(BuildContext context) {
    return ScaffoldSimpleBodyGW.home(
      adaptativeScreen: adaptativeScreen,
      appBar: CustomAppbarGW.home(
        context: context,
        names: 'Bakke Medina',
        url: 'https://i.postimg.cc/htsKyKNB/temp-Imagex-FMg-Y3.avif',
        contactsLength: 10,
      ),
      body: Placeholder(),
    );
  }
}
