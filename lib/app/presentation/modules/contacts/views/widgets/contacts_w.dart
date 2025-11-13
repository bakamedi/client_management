import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import '../../../../../core/adaptative_screen/adaptive_screen.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../domain/responses/contacts/contacts_response.dart';
import '../../../../extensions/contacts_ext.dart';
import '../../../../extensions/widgets_ext.dart';
import '../../../../extensions/strings_ext.dart';

import '../../../../global/widgets/text/custom_text_gw.dart';
import '../../utils/open_edit_contact.dart';

class ContactsW extends StatelessWidget {
  const ContactsW({super.key, required this.contacts, required this.internet});
  final List<ContactResponse> contacts;
  final bool internet;

  @override
  Widget build(BuildContext context) {
    final AdaptiveScreen adaptiveScreen = AdaptiveScreen(context);
    return CustomScrollView(
      slivers: <Widget>[
        internet
            ? SizedBox(
                width: adaptiveScreen.bwh(100),
                height: adaptiveScreen.bhp(3.5),
                child: ColoredBox(
                  color: AppColors.grey400.withValues(alpha: .7),
                  child: CustomTextGW.text(
                    'Sin conexión',
                    adaptiveScreen: adaptiveScreen,
                    fontSize: adaptiveScreen.dp(1.5),
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ).center,
                ),
              ).center.sliverBox
            : 1.h.sliverBox,
        contacts.isEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    EvaIcons.peopleOutline,
                    size: adaptiveScreen.dp(20),
                    color: AppColors.grey400.withValues(alpha: 0.4),
                  ),
                  CustomTextGW.text(
                    'No hay contactos ',
                    adaptiveScreen: adaptiveScreen,
                    fontSize: adaptiveScreen.dp(1.5),
                    fontWeight: FontWeight.bold,
                    color: AppColors.grey400.withValues(alpha: 0.4),
                  ),
                ],
              ).center.sliverBox.sliverPadding(
                EdgeInsets.only(top: adaptiveScreen.bhp(20)),
              )
            : SliverList.builder(
                itemCount: contacts.length,
                itemBuilder: (BuildContext context, int index) {
                  final ContactResponse contact = contacts[index];
                  return ListTile(
                    onTap: () => openEditContact(context, contact),
                    leading: _buildHeader(contact, adaptiveScreen),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextGW.text(
                          contact.fullName,
                          adaptiveScreen: adaptiveScreen,
                          fontSize: adaptiveScreen.dp(1.5),
                          fontWeight: FontWeight.bold,
                        ),
                        CustomTextGW.text(
                          contact.cellPhoneNumber!,
                          adaptiveScreen: adaptiveScreen,
                          fontSize: adaptiveScreen.dp(1.3),
                          color: AppColors.grey400,
                        ),
                      ],
                    ),
                  );
                },
              ).sliverPadding(
                EdgeInsets.symmetric(horizontal: adaptiveScreen.bwh(2)),
              ),
      ],
    );
  }

  Widget _buildHeader(
    ContactResponse contact,
    AdaptiveScreen adaptiveScreen,
  ) {
    final initials = contact.initials;
    final profileImage = contact.profileImage?.getUrlProfile ?? '';

    return CircleAvatar(
      backgroundImage: (profileImage.isNotEmpty && !internet)
          ? NetworkImage(profileImage)
          : null,
      child: (profileImage.isEmpty || internet)
          ? CustomTextGW.text(initials, adaptiveScreen: adaptiveScreen)
          : null,
    );
  }
}
