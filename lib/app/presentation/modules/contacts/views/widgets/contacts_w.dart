import 'package:flutter/material.dart';

import '../../../../../core/adaptative_screen/adaptative_screen.dart';
import '../../../../global/widgets/text/custom_text_gw.dart';

class ContactsW extends StatelessWidget {
  const ContactsW({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AdaptativeScreen adaptativeScreen = AdaptativeScreen(context);
    return CustomScrollView(
      slivers: <Widget>[
        SliverList.builder(
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: const CircleAvatar(
                child: Text('CH'),
              ),
              title: Column(
                children: [
                  CustomTextGW.text(
                    'Carlos Herrera',
                    adaptativeScreen: adaptativeScreen,
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
