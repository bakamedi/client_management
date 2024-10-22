import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../../../../../core/adaptative_screen/adaptative_screen.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../domain/responses/contacts/contacts_response.dart';
import '../../../../extensions/contacts_ext.dart';
import '../../../../extensions/widgets_ext.dart';
import '../../../../global/widgets/text/custom_text_gw.dart';
import '../../utils/open_edit_contact.dart';

class ContactsW extends StatelessWidget {
  final List<ContactResponse> contacts;

  const ContactsW({
    super.key,
    required this.contacts,
  });

  @override
  Widget build(BuildContext context) {
    final AdaptativeScreen adaptativeScreen = AdaptativeScreen(context);
    return CustomScrollView(
      slivers: <Widget>[
        contacts.isEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    EvaIcons.peopleOutline,
                    size: adaptativeScreen.dp(20),
                    color: AppColors.grey400.withOpacity(0.4),
                  ),
                  CustomTextGW.text(
                    'No hay contactos ',
                    adaptativeScreen: adaptativeScreen,
                    fontSize: adaptativeScreen.dp(1.5),
                    fontWeight: FontWeight.bold,
                    color: AppColors.grey400.withOpacity(0.4),
                  ),
                ],
              ).center.sliverBox.sliverPadding(
                  EdgeInsets.only(
                    top: adaptativeScreen.bhp(20),
                  ),
                )
            : SliverList.builder(
                itemCount: contacts.length,
                itemBuilder: (BuildContext context, int index) {
                  final ContactResponse contact = contacts[index];
                  return ListTile(
                    onTap: () => openEditContact(context, contact),
                    leading: CircleAvatar(
                      child: CustomTextGW.text(
                        contact.initials,
                        adaptativeScreen: adaptativeScreen,
                      ),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextGW.text(
                          contact.fullName,
                          adaptativeScreen: adaptativeScreen,
                          fontSize: adaptativeScreen.dp(1.5),
                          fontWeight: FontWeight.bold,
                        ),
                        CustomTextGW.text(
                          contact.cellPhoneNumber!,
                          adaptativeScreen: adaptativeScreen,
                          fontSize: adaptativeScreen.dp(1.3),
                          color: AppColors.grey400,
                        ),
                      ],
                    ),
                  );
                },
              ).sliverPadding(
                EdgeInsets.symmetric(
                  horizontal: adaptativeScreen.bwh(2),
                ),
              ),
      ],
    );
  }
}
